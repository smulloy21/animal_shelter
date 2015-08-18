require('spec_helper')

describe(PetOwner) do

  describe('.all') do
    it('is empty at first') do
      expect(PetOwner.all()).to(eq([]))
    end
  end
end
