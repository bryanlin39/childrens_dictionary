require('rspec')
require('definition')

describe(Definition) do

  describe('#definition_input') do
    it('returns the inputted definition') do
      test_definition = Definition.new({:definition_input => 'a cute domesticated mammal that is sometimes friendly but more often not'})
      expect(test_definition.definition_input()).to(eq('a cute domesticated mammal that is sometimes friendly but more often not'))
    end
  end

end
