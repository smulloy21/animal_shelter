require('rspec')
require('animals')
require('pet_owner')
require('pg')

DB = PG.connect({:dbname => 'animal_shelter_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM animals *;")
    DB.exec("DELETE FROM pet_owner *;")
  end
end
