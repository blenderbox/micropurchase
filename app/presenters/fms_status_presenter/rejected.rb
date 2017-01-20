class FmsStatusPresenter::Rejected < FmsStatusPresenter::Base
  def flash_type
    :error
  end

  def status_class
    'error'
  end

  def status_text
    'Valid (inactive) '
  end

  def admin_status_text
    'Rejected'
  end

  def message
    "Your FNS Vendor Number was not found in nyc checkbox.gov. Please enter a valid FMS Vendor Number
    to complete your profile. Check
    https://www.sam.gov/portal/SAM to make sure
    your FMS number is correct. If you need any help email us at
    jasonblend@yahoo.com"
  end
end
