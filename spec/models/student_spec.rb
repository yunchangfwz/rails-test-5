require 'rails_helper'

RSpec.describe Student, type: :model do
  context 'Association' do
    it { should have_and_belong_to_many :schools }
  end
  
  describe '#Age must greater than 18' do
    let!(:student) { FactoryGirl.build(:student, dob: "29-04-2009") }

    it "title is shorter than description" do 
      student.validate
      expect(student.errors.messages).to include(dob: ["Age must greater than 18"])
    end
  end

  describe 'schoolmates' do
     let!(:john)   { create(:student, dob: '1980-12-30') }    
     let!(:alex)   { create(:student, dob: '1988-12-30') }
     let!(:school) { create(:school) }    
     let!(:schools_student_john) { SchoolsUser.create(school_id: school.id, student_id: john.id) }
     let!(:schools_student_alex) { SchoolsUser.create(school_id: school.id, student_id: alex.id) }

     it 'get student schoolmates' do
       john.schoolmates.should include alex
     end
  end
end