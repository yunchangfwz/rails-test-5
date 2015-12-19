class OfficeWorker < User
  before_validation :age_greater_than_20

  private
  def age_greater_than_20
    return false if dob.nil?
    if (dob.to_date + 20.years) > Date.today
      errors.add(:dob, "Age must greater than 20")
    end
  end
end