require 'rails_helper'

RSpec.describe School, type: :model do
  describe "attributes" do
    it 'accepts new students if students is low' do
      expect(FactoryGirl.create(:school).admission).to eq('Accepted')
    end 

    it 'denies new students if students is high' do
      expect(FactoryGirl.create(:school, students: 12000).admission).to eq('Denied')
    end 
  end 

  describe 'validations' do
    it {should validate_presence_of :name}
  end 

end
