require 'rails_helper'

RSpec.describe Student, type: :model do
  context 'Validation' do
    it { should validate_presence_of :name }
  end

  describe '#Age must greater than 18' do
    let!(:student) { FactoryGirl.build(:student, dob: "29-04-2009") }

    it "title is shorter than description" do 
      student.validate
      expect(student.errors.messages).to include(dob: ["Age must greater than 18"])
    end
  end
end