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
    to complete your profile. Check the city's Payee Information Portal (PIP) at 
    https://a127-pip.nyc.gov/webapp/PRDPCW/SelfService to make sure
    your FMS number is correct. If you need any help contact us at http://www1.nyc.gov/site/forward/contact/contact.page"
  end
end
