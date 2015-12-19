class Student < User
  before_validation :age_greater_than_18

  def age
    return 0 unless dob
    age = Date.today.year - dob.year 
    age -= 1 if dob > Date.today.years_ago( age )
    age
  end

  private
  def age_greater_than_18
    return false if dob.nil?
    if (dob.to_date + 18.years) > Date.today
      errors.add(:dob, "Age must greater than 18")
    end
  end

end