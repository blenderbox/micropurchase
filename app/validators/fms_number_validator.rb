require 'samwise'

class FmsNumberValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if !value.blank? && invalid_fms_number?(value)
      record.errors[attribute] << I18n.t('activerecord.errors.models.user.attributes.duns_number.invalid')
    end
  end

  private

  def invalid_fms_number?(value)
    !contains_ten_integers?
  end

  def contains_ten_integers?(fms_number)
    if fms_number.present?
      fms_number.match(/\A\d{10}\z/)
    end
  end
end
