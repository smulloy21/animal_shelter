require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add a new animal to the system', {:type => :feature}) do
  it('adds a new animal to the system') do
    visit('/animals')
    fill_in('name', :with => 'Max')
    fill_in('age', :with => '4')
    fill_in('species', :with => 'dog')
    fill_in('breed', :with => 'border collie')
    fill_in('date_of_admittance', :with => '2015-8-13')
    click_button('Add Animal')
    expect(page).to have_content('Max')
  end
end

describe('add a new applicant to the system', {:type => :feature}) do
  it('adds a new applicant to the system') do
    visit('/potential_pet_owners')
    fill_in('name', :with => 'Steve')
    fill_in('phone', :with => '555-5555')
    fill_in('animal_species_preference', :with => 'Dog')
    fill_in('animal_breed_preference', :with => 'German Shepherd')
    click_button('Add Applicant')
    expect(page).to have_content('Steve')
  end
end
