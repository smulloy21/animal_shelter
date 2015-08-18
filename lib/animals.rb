class Animal
  attr_reader(:name, :gender, :date_of_admittance, :age, :species, :breed, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @gender = attributes.fetch(:gender)
    @date_of_admittance = attributes.fetch(:date_of_admittance)
    @age = attributes.fetch(:age)
    @species = attributes.fetch(:species)
    @breed = attributes.fetch(:breed)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_animals = DB.exec("SELECT * FROM animals;")
    animals = []
    returned_animals.each() do |animal|
      name = animal.fetch('name')
      gender = animal.fetch('gender')
      date_of_admittance = animal.fetch('date_of_admittance')
      age = animal.fetch('age').to_i()
      species = animal.fetch('species')
      breed = animal.fetch('breed')
      id = animal.fetch('id').to_i()
      animals.push(Animal.new({:name => name, :gender => gender, :date_of_admittance => date_of_admittance, :age => age, :species => species, :breed => breed, :id => id}))
    end
    animals
  end

  define_method(:==) do |other|
    self.id().eql?(other.id())
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO animals (name, gender, date_of_admittance, age, species, breed) VALUES ('#{@name}', '#{@gender}', '#{@date_of_admittance}', #{@age}, '#{@species}', '#{@breed}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  define_singleton_method(:find) do |id|
    Animal.all().each() do |animal|
      if animal.id() == id
        return animal
      end
    end
  end

  define_singleton_method(:all_by_breed) do
    Animal.all().sort_by(&:breed)
  end

  define_singleton_method(:all_by_age) do
    Animal.all().sort_by(&:age)
  end

end
