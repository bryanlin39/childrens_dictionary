require('rspec')
require('word')
require('definition')

describe(Word) do

  describe('#word_input') do
    it('returns the inputted word') do
      test_word = Word.new({:word_input=> 'cat'})
      expect(test_word.word_input()).to(eq('cat'))
    end
  end

end
