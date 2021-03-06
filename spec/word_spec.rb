require('rspec')
require('word')
require('definition')

describe(Word) do

  before() do
    Word.clear()
  end

  describe('#word_input') do
    it('returns the inputted word') do
      test_word = Word.new({:word_input => 'cat'})
      expect(test_word.word_input()).to(eq('cat'))
    end
  end

  describe('.all') do
    it('returns all of the words in the words class variable') do
      expect(Word.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves the word into the words class variable') do
      test_word = Word.new({:word_input => 'cat'})
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe('#id') do
    it('returns the id of the word') do
      test_word1 = Word.new({:word_input => 'cat'})
      test_word1.save()
      test_word2 = Word.new({:word_input => 'dog'})
      test_word2.save()
      expect(test_word2.id()).to(eq(2))
    end
  end

  describe('.find') do
    it('returns the word based on the word id') do
      test_word = Word.new({:word_input => 'cat'})
      test_word.save()
      expect(Word.find(test_word.id())).to(eq(test_word))
    end
  end

  describe('#definitions') do
    it('returns the definitions associated with the word') do
      test_word = Word.new({:word_input => 'cat'})
      expect(test_word.definitions()).to(eq([]))
    end
  end

  describe('#add_definition') do
    it('saves the definition into the word definitions array') do
      test_word = Word.new({:word_input => 'cat'})
      test_definition = Definition.new({:definition_input => 'a cute domesticated mammal that is sometimes friendly but more often not'})
      test_word.add_definition(test_definition)
      expect(test_word.definitions()).to(eq([test_definition]))
    end
  end

  describe('#picture') do
    it('returns the inputted picture link') do
      test_word = Word.new({:word_input => 'cat', :picture => 'http://www.royalcanin.ca/~/media/Royal-Canin-Canada/Product-Categories/cat-adult-landing-hero.ashx'})
      expect(test_word.picture()).to(eq('http://www.royalcanin.ca/~/media/Royal-Canin-Canada/Product-Categories/cat-adult-landing-hero.ashx'))
    end
  end

  describe('.sort_alphabetically') do
    it('sorts the words in the words class variable alphabetically and returns all of the sorted words') do
      test_word1 = Word.new({:word_input => 'dog'})
      test_word1.save()
      test_word2 = Word.new({:word_input => 'cat'})
      test_word2.save()
      expect(Word.sort_alphabetically()).to(eq([test_word2, test_word1]))
    end
  end

  describe('.search') do
    it('returns the word based on the inputted search word') do
      test_word = Word.new({:word_input => 'cat'})
      test_word.save()
      expect(Word.search('cat')).to(eq(test_word))
    end
  end

end
