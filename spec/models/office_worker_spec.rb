require 'rails_helper'

RSpec.describe OfficeWorker, type: :model do
  describe '#Age must greater than 20' do
    let!(:office_worker) { FactoryGirl.build(:office_worker, dob: "29-04-2009") }

    it "title is shorter than description" do 
      office_worker.validate
      expect(office_worker.errors.messages).to include(dob: ["Age must greater than 20"])
    end
  end
end