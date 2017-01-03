class FmsAccountReckoner < Struct.new(:user)
  def set_default_fms_status
    if user.fms_number.blank?
      user.fms_status = :fms_blank
    elsif should_clear_status?
      user.fms_status = :fms_pending
    end
  end

  def set!
    update_fms_status
    update_small_business

    if user.changed?
      user.save
    end
  end

  private

  def update_small_business
    if user.fms_accepted?
      user.small_business = fms_is_small_business?
    elsif user.fms_blank?
      user.small_business = false
    end
  end

  def update_fms_status
    if user.fms_pending?
      user.fms_status = fms_status
    end
  end

  def should_clear_status?
    user.persisted? && user.fms_number_changed?
  end

  def fms_status
    if fms_is_in_checkbook?
      :fms_accepted
    else
      :fms_rejected
    end
  end

  def client
    @client ||= Samwise::Client.new(api_key: DataDotGovCredentials.api_key)
  end

  def vendor_summary
    @vendor_summary ||= client.get_vendor_summary(fms: user.fms_number)
  end

  def fms_is_in_checkbook?
    vendor_summary[:in_fms] == true
  end

  def fms_is_small_business?
    vendor_summary[:small_business] == true
  end
end
