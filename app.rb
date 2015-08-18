require('sinatra')
require('sinatra/reloader')
require('./lib/pet_owner')
require('./lib/animals')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "animal_shelter_test"})

get('/') do
  erb(:index)
end

get('/dogs') do
  @dogs = Animal.dogs()
  erb(:dogs)
end

post('/dogs/by_age') do
  @dogs = Animal.dogs().sort_by(&:age)
  erb(:dogs)
end

post('/dogs/by_breed') do
  @dogs = Animal.dogs().sort_by(&:breed)
  erb(:dogs)
end

post('/dogs/by_gender') do
  @dogs = Animal.dogs().sort_by(&:gender)
  erb(:dogs)
end

post('/dogs/new') do
  name = params.fetch('name')
  age = params.fetch('age').to_i()
  gender = params.fetch('gender')
  species = params.fetch('species')
  breed = params.fetch('breed')
  date_of_admittance = params.fetch('date_of_admittance')
  animal = Animal.new({:name => name, :age => age, :gender => gender, :species => species, :breed => breed, :date_of_admittance => date_of_admittance, :id => nil})
  animal.save()
  redirect('/dogs')
end

get('/cats') do
  @cats = Animal.cats()
  erb(:cats)
end

post('/cats/by_age') do
  @cats = Animal.cats().sort_by(&:age)
  erb(:cats)
end

post('/cats/by_breed') do
  @cats = Animal.cats().sort_by(&:breed)
  erb(:cats)
end

post('/cats/by_gender') do
  @cats = Animal.cats().sort_by(&:gender)
  erb(:cats)
end

post('/cats/new') do
  name = params.fetch('name')
  age = params.fetch('age').to_i()
  gender = params.fetch('gender')
  species = params.fetch('species')
  breed = params.fetch('breed')
  date_of_admittance = params.fetch('date_of_admittance')
  animal = Animal.new({:name => name, :age => age, :gender => gender, :species => species, :breed => breed, :date_of_admittance => date_of_admittance, :id => nil})
  animal.save()
  redirect('/cats')
end

get('/other_pets') do
  @other_pets = Animal.other_pets()
  erb(:other_pets)
end

post('/other_pets/by_age') do
  @other_pets = Animal.other_pets().sort_by(&:age)
  erb(:other_pets)
end

post('/other_pets/by_breed') do
  @other_pets = Animal.other_pets().sort_by(&:breed)
  erb(:other_pets)
end

post('/other_pets/by_gender') do
  @other_pets = Animal.other_pets().sort_by(&:gender)
  erb(:other_pets)
end

post('/other_pets/new') do
  name = params.fetch('name')
  age = params.fetch('age').to_i()
  gender = params.fetch('gender')
  species = params.fetch('species')
  breed = params.fetch('breed')
  date_of_admittance = params.fetch('date_of_admittance')
  animal = Animal.new({:name => name, :age => age, :gender => gender, :species => species, :breed => breed, :date_of_admittance => date_of_admittance, :id => nil})
  animal.save()
  redirect('/other_pets')
end

get('/animals') do
  @animals = Animal.all().sort_by(&:date_of_admittance)
  erb(:animals)
end

post('/animals/new') do
  name = params.fetch('name')
  age = params.fetch('age').to_i()
  gender = params.fetch('gender')
  species = params.fetch('species')
  breed = params.fetch('breed')
  date_of_admittance = params.fetch('date_of_admittance')
  animal = Animal.new({:name => name, :age => age, :gender => gender, :species => species, :breed => breed, :date_of_admittance => date_of_admittance, :id => nil})
  animal.save()
  redirect('/animals')
end

get('/potential_pet_owners') do
  @pet_owners = PetOwner.all().sort_by(&:animal_breed_preference)
  erb(:potential_pet_owners)
end

post('/applicant/new') do
  name = params.fetch('name')
  phone = params.fetch('phone').to_i()
  animal_breed_preference = params.fetch('animal_breed_preference')
  animal_species_preference = params.fetch('animal_species_preference')
  owner = PetOwner.new({:name => name, :phone => phone, :animal_species_preference => animal_species_preference, :animal_breed_preference => animal_breed_preference, :id => nil})
  owner.save()
  redirect('/potential_pet_owners')
end
