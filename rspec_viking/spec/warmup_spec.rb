require 'warmup'
require 'rspec'

describe Warmup do
  let (:test_warmup) {Warmup.new}

  describe '.get_shout' do

    it 'should return a shout' do
      test_string ="AAAAAAH"
      allow(test_warmup).to receive(:gets_shout).and_return(test_string)
      expect(test_warmup.gets_shout).to equal(test_string)
    end
  end

  describe 'triple_size' do
    let (:tripler) {double("double", size: 3)}
    it 'should triple the size of the array' do
      expect(test_warmup.triple_size(tripler)).to equal(9)
    end
  end

  describe 'calls_some_methods' do

    it 'should receive the upcase method call' do
      expect(test_warmup.calls_some_methods).to receive(:upcase)
    end
  end
end
