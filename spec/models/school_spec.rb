require 'rails_helper'

RSpec.describe School, type: :model do
  context 'Validation' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }
  end

end