require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
also_reload('lib/**/*.rb')
require('pry')

get('/') do
  @words = Word.all()
  erb(:index)
end

post('/word_form') do
  inputted_word = params[:inputted_word].downcase().capitalize()
  inputted_picture = params[:inputted_picture]
  @new_word = Word.new({:word_input => inputted_word, :picture => inputted_picture})
  @new_word.save()
  @words = Word.all()
  erb(:index)
end

get('/word/:id') do
  @words = Word.all()
  word_id = params['id'].to_i()
  @word = Word.find(word_id)
  @definitions = @word.definitions()
  erb(:word)
end

post('/definition_form/:id') do
  word_id = params['id'].to_i()
  @word = Word.find(word_id)
  inputted_definition = params[:inputted_definition].downcase()
  @new_definition = Definition.new({:definition_input => inputted_definition})
  @word.add_definition(@new_definition)
  @definitions = @word.definitions()
  erb(:word)
end
