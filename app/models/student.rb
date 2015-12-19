class Student < User
  has_and_belongs_to_many :schools
  before_validation :age_greater_than_18

  def age_greater_than_18
    return false if dob.nil?
    if (dob.to_date + 18.years) > Date.today
      errors.add(:dob, "Age must greater than 18")
    end
  end
end