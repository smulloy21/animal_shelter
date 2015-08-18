class PetOwner
  attr_reader(:name, :phone, :animal_species_preference, :animal_breed_preference, :id)

  define_method(:initialize) do |attributes|
  @name = attributes.fetch(:name)
  @phone = attributes.fetch(:phone)
  @animal_species_preference = attributes.fetch(:animal_species_preference)
  @animal_breed_preference = attributes.fetch(:animal_breed_preference)
  @id = attributes.fetch(:id)

  end

  define_singleton_method(:all) do
    returned_pet_owners = DB.exec('SELECT * FROM pet_owner;')
    pet_owner = []
    returned_pet_owners.each() do |owner|
      name = owner.fetch('name')
      phone = owner.fetch('phone').to_i()
      animal_species_preference = owner.fetch('animal_species_preference')
      animal_breed_preference = owner.fetch('animal_breed_preference')
      id = owner.fetch('id').to_i()
      pet_owner.push(PetOwner.new({:name => name, :phone => phone, :animal_species_preference => animal_species_preference, :animal_breed_preference => animal_breed_preference, :id => id}))
    end
    pet_owner
  end
end
