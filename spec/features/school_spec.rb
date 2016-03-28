require 'rails_helper'

feature "no school", js: true do 
  before(:each) do
    visit root_path 
    end  

  scenario "check for no school" do
    expect(page).to have_content('No Schools')
  end 

end

feature "create a school" do
  before(:each) do
    visit root_path
  end 

  scenario "adds 1 new school" do 
    click_link('New School')
    fill_in('Name', with: 'UF')
    fill_in('Location', with: 'Gainesville')
    fill_in('Students', with: 15000)
    click_button('Create School')
    expect(page).to have_content('UF')
    expect(page).to have_content('Gainesville')
    expect(page).to have_content('15000')
  end 
end 