require('spec_helper')

describe(Animal) do

  describe('.all') do
    it('starts off with no animals') do
      expect(Animal.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same animal if it has the same id") do
      animal1 = Animal.new({:name => 'Fluffy', :gender => 'boy', :date_of_admittance => '2015-6-05', :age => 1, :species => 'dog', :breed => 'aussie shepherd', :id => nil})
      animal2 = Animal.new({:name => 'Fluffy', :gender => 'boy', :date_of_admittance => '2015-6-05', :age => 1, :species => 'dog', :breed => 'aussie shepherd', :id => nil})
      expect(animal1).to(eq(animal2))
    end
  end

  describe('#save') do
    it('will add an instance of animal to the database') do
      animal1 = Animal.new({:name => 'Fluffy', :gender => 'boy', :date_of_admittance => '2015-6-05', :age => 1, :species => 'dog', :breed => 'aussie shepherd', :id => nil})
      animal1.save()
      expect(Animal.all).to(eq([animal1]))
    end
  end
end
