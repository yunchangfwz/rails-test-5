class School < ActiveRecord::Base
  validates  :name, :address, presence: true
  
end