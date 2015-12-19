class Student < User
  validate :age_greater_than_18
  has_and_belongs_to_many :schools

  def schoolmates
    school_ids = self.schools.pluck(:id)
    user_ids = SchoolsUser.where(school_id: school_ids).pluck(:student_id)
    Student.find(user_ids)
  end

  private
  def age_greater_than_18
    return false if dob.nil?
    if (dob.to_date + 18.years) > Date.today
      errors.add(:dob, "Age must greater than 18")
    end
  end

end