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
