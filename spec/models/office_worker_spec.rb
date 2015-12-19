require 'rails_helper'

RSpec.describe OfficeWorker, type: :model do
  context 'Validation' do
    it { should validate_presence_of :years_of_exp }
    it { should validate_numericality_of( :years_of_exp ).is_greater_than_or_equal_to(0) }
  end

  describe '#Age must greater than 20' do
    let!(:office_worker) { FactoryGirl.build(:office_worker, dob: "29-04-2009") }

    it "title is shorter than description" do 
      office_worker.validate
      expect(office_worker.errors.messages).to include(dob: ["Age must greater than 20"])
    end
  end
end