class Word

  @@words = []

  attr_accessor(:word_input, :id, :definitions, :picture)

  def initialize(attributes)
    @word_input = attributes[:word_input]
    @id = @@words.length() + 1
    @definitions = []
    @picture = attributes[:picture]
  end

  def self.all
    @@words
  end

  def save
    @@words.push(self)
  end

  def self.clear
    @@words = []
  end

  def self.find(id)
    found_word = nil
    @@words.each() do |word|
      if word.id() == id
        found_word = word
      end
    end
    found_word
  end

  def add_definition(definition)
    @definitions.push(definition)
  end
  
end
