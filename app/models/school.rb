class School < ActiveRecord::Base
  extend Enumerize

  validates  :name, :address, presence: true
  enumerize  :type_of_school, in: [:university, :high_school, :secondary_school, :primary_school], default: :primary_school
end