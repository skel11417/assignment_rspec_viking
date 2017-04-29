# Your code here
require 'viking'
require 'rspec'

# Passing a name to a new Viking sets that name attribute
# Passing a health attribute to a new Viking sets that health attribute
# health cannot be overwritten after it's been set on initialize
# A Viking's weapon starts out nil by default
# Picking up a Weapon sets it as the Viking's weapon
#6 Picking up a non-Weapon raises an exception
#7 Picking up a new Weapon replaces the Viking's existing weapon
#8 Dropping a Viking's weapon leaves the Viking weaponless
# The receive_attack method reduces that Viking's health by the specified amount
# The receive_attack method calls the take_damage method (hint: recall expect(...).to receive(...))
# attacking another Viking causes the recipient's health to drop
# attacking another Viking calls that Viking's take_damage method
# attacking with no weapon runs damage_with_fists
# attacking with no weapon deals Fists multiplier times strength damage
# attacking with a weapon runs damage_with_weapon
# attacking with a weapon deals damage equal to the Viking's strength times that Weapon's multiplier
# attacking using a Bow without enough arrows uses Fists instead
# Killing a Viking raises an error

describe Viking do
  let(:viking) {Viking.new :name => "Joey"}
  describe '#name' do
    it 'returns inputted name' do
      allow(viking).to receive(:name).and_return("Joey")
      expect(viking.name).to eq("Joey")
    end
  end
  describe '#health' do
    it "assigns a health attribute to a new viking" do
      allow(viking).to receive(:health).and_return(100)
      viking.health
    end
    it 'cannot be overwritten after initiliazation' do
    end
  end

  describe '#weapon' do
    it 'is nil by default' do
      expect(viking.weapon).to eq(nil)
    end

    it 'raises an error when pickup non-weapon' do
      expect(viking.pick_up_weapon("non-weapon")).to raise("Cant pick up that thing")
    end

    it 'replaces existing weapon with new weapon' do
      new_weapon = double("new_weapon", is_a?: Weapon)
      viking.pick_up_weapon(new_weapon)
      expect(viking.weapon).to eq(new_weapon)
    end

    it 'removes weapon when drop_weapon' do
      
      viking.drop_weapon
      expect(viking.weapon).to eq(nil)
    end
  end


end
