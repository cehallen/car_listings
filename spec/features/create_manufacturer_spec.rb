require 'spec_helper'

feature 'create a manufacturer', %Q{
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot
} do

# Acceptance Criteria:

# * I must specify a manufacturer name and country.
# * If I do not specify the required information, I am presented with errors.
# * If I specify the required information, the manufacturer is recorded and I am 
#   redirected to enter another new manufacturer.


  scenario 'with valid attributes' do
    prev_count = Manufacturer.count
    visit manufacturers_path
    click_on 'Add Manufacturer'

    fill_in 'Name', with: 'Tesla'
    select 'United States', from: 'Country'
    click_button 'Submit'

    expect(page).to have_content('Manufacturer added!')
    expect(Manufacturer.count).to eq(prev_count + 1)
  end

  scenario 'with invalid attributes' do
    prev_count = Manufacturer.count
    visit manufacturers_path
    click_on 'Add Manufacturer'

    click_button 'Submit'

    expect(page).to_not have_content('Manufacturer added!')
    expect(page).to have_content("can't be blank")
    expect(Manufacturer.count).to eq(prev_count)
  end
end
