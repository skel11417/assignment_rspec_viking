# # Your code here
require 'rspec_viking/version'
# A Bow's arrow count is readable
# A Bow starts with 10 arrows by default
# A Bow created with a specified number of arrows starts with that number of arrows
# useing a Bow reduces arrows by 1
# useing a Bow with 0 arrows throws an error

require 'weapons/bow'
require 'rspec'

describe Bow do
  let(:bow) {Bow.new}

  context 'initialize new bow' do
    # let(:arrows) do
    #   double('arrows', :arrows => nil)
    # end
    it 'should provide you the count of arrows' do
      allow(bow).to receive(:arrows).and_return(nil)
      expect(bow).to receive(:arrows).and_return(nil)
      bow.arrows
    end
  end

  describe '#arrows' do
    it 'should return a value of 10 by default' do
      expect(bow.arrows).to equal(10)
    end
    let(:bow_15) {Bow.new(15)}
    it 'starts with specified number of arrows' do
      # allow(bow_15).to receive(:initialize).and_return(15)
      expect(bow_15.arrows).to equal(15)
    end
  end

  describe '#use' do
    it 'reduces the number of arrows by one' do
      bow.use
      expect(bow.arrows).to equal(9)
    end
    it 'throws an error when arrows <= 0' do
      # dbl = double('doubled_arrows', arrows: 0)
      # allow(dbl).to receive(:out_of_arrows).and_return(true)
      # bow_0 = Bow.new(0)
      # allow(no_arrows).to receive(:arrows).and_return(0)
      allow(bow).to receive(:out_of_arrows).and_return(true)
      expect(bow.use).to raise("Out of arrows")
      bow_0.use
    end
  end
end
