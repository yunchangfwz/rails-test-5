require 'rails_helper'

RSpec.describe School, type: :model do
  context 'Validation' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }
    it { should enumerize(:type_of_school).in(:university, :high_school, :secondary_school, :primary_school) }
  end

end