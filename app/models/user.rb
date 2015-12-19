class User < ActiveRecord::Base
  validates  :name, presence: true

  def age
    return 0 unless dob
    age = Date.today.year - dob.year 
    age -= 1 if dob > Date.today.years_ago( age )
    age
  end
end
