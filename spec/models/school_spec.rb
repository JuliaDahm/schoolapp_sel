require 'rails_helper'

RSpec.describe School, type: :model do
  describe "attributes" do
    it 'accepts new students if students is low' do
      school = School.create(name: 'FSU', students: 1000)
      expect(school.admission).to eq('Accepted')
    end 

    it 'denies new students if students is high' do
      school = School.create(name: 'UCF', students: 6000)
      expect(school.admission).to eq('Denied')
    end 
  end 

  describe 'validations' do
    it {should validate_presence_of :name}
  end 

end
