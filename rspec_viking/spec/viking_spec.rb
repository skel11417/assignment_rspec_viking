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
#9 The receive_attack method reduces that Viking's health by the specified amount
#10 The receive_attack method calls the take_damage method (hint: recall expect(...).to receive(...))
#11 attacking another Viking causes the recipient's health to drop
#12 attacking another Viking calls that Viking's take_damage method
#13 attacking with no weapon runs damage_with_fists
#14 attacking with no weapon deals Fists multiplier times strength damage
#15 attacking with a weapon runs damage_with_weapon
# attacking with a weapon deals damage equal to the Viking's strength times that Weapon's multiplier
# attacking using a Bow without enough arrows uses Fists instead
# Killing a Viking raises an error

describe Viking do
  let(:viking) {Viking.new( :name => "Joey")}
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
      new_weapon = double("new_weapon", is_a?: Weapon)
      viking.pick_up_weapon(new_weapon)
      expect(viking.weapon).to eq(new_weapon)
      viking.drop_weapon
      expect(viking.weapon).to eq(nil)
    end
  end

  describe '#receive_attack' do
    it 'reduces health by given value' do
      viking.receive_attack(10)
      expect(viking.health).to eq(90)
    end

    it 'calls the take damage method' do
      expect(viking).to receive(:take_damage).with(10)
      viking.receive_attack(10)
    end
    # let(:target) do
    #   double('target_viking', :name => "fred", :health => nil)
    # end
    let(:target) {Viking.new }
    # dbl = double('name_double', name: "ted")

    it 'should cause damage to the attacked viking' do
      viking.attack(target)
      expect(target.health).to eq(97.5)
    end

    # let(:target) do
    #   double('target_viking', name: "ted", take_damage: nil)
    # end
    # let(:target) {Viking.new}
    it 'should call the receive_attack method on the attacked viking' do
      target = Viking.new
      expect(target).to receive(:receive_attack)
      viking.attack(target)
    end
  end


  describe '#attack' do
    let(:target) do
      double('target_viking', name: nil, take_damage: nil, receive_attack: nil)
    end
    it 'calls damage_with_fists if no_weapon' do
      expect(viking).to receive(:damage_with_fists)
      viking.attack(target)
    end

    it 'deals Fists multiplier'

    let(:weapon) do
      double('weapon', :weapon => Bow.new)
    end
    it 'calls damage with weapon' do
      expect(viking).to receive(:weapon)
      expect(viking).to receive(:damage_with_weapon)
      viking.attack(target)
    end

    # attacking with a weapon deals damage equal to the Viking's strength times that Weapon's multiplier

    # attacking using a Bow without enough arrows uses Fists instead
    let (:bow) {double('bow', :arrows => 0, :is_a? => Weapon)}
    it 'uses Fists if arrows depleted' do

      expect(viking).to receive(:damage_with_fists)
      viking.pick_up_weapon(bow)
      viking.attack(target)
    end
  end

  # Killing a Viking raises an error
  describe '#check_death' do
    
    it 'raises an error if viking dies' do
      expect(viking.check_death).to raise_error


    end
  end


end
