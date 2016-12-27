class FmsStatusPresenter::Pending < FmsStatusPresenter::Base
  def flash_type
    :warning
  end

  def status_class
    'pending'
  end

  def admin_status_text
    'Pending'
  end

  def status_text
    'Verifying'
  end

  def message
    "Your profile is pending while your FMS number is being validated. This
    typically takes less than one hour"
  end
end
