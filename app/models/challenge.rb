class Challenge < ApplicationRecord
  # Before create an object with this class, all the validations must be true
  validates :title, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date



  private
  # Custom validation to ensure end_date is after start_date
  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
