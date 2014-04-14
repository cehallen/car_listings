require 'spec_helper'

feature 'create a car', %Q{
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot
} do

# Acceptance Criteria:

# * I must specify the color, year, and mileage of the car.
# * Only years from 1980 and above can be specified.
# * I can optionally specify a description of the car.
# * If I enter all of the required information in the required formats, 
#   the car is recorded.
# * If I do not specify all of the required information in the 
#   required formats, the car is not recorded and I am presented with errors.
# * Upon successfully creating a car, I am redirected so that 
#   I can create another car.

  before(:each) do
    @manufacturer = FactoryGirl.create(:manufacturer)
  end

  scenario 'with valid attributes' do
    prev_count = Car.count
    visit manufacturer_path(@manufacturer)
    click_on 'Add a Car'

    fill_in 'Color', with: 'Black'
    fill_in 'Year', with: '2013'
    fill_in 'Mileage', with: '20000'
    fill_in 'Description', with: 'Runs good'
    click_button 'Submit'

    expect(page).to have_content('Car added!')
    expect(page).to have_content('Add a Car')
    expect(Car.count).to eq(prev_count + 1)
  end

  scenario 'with invalid attributes' do
    prev_count = Car.count
    visit manufacturer_path(@manufacturer)
    click_on 'Add a Car'

    click_button 'Submit'

    expect(page).to_not have_content('Car added!')
    expect(page).to have_content('You had missing fields')
    expect(Car.count).to eq(prev_count)
  end
end
