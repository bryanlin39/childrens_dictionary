require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the add-definition path', {:type => :feature}) do
  it('adds the user-inputted string to a list of definitions on the word page') do
    visit('/')
    fill_in('inputted_word', :with=> 'Cat')
    click_button('Add Word')
    visit('/word/1')
    fill_in('inputted_definition', :with=> 'a cute domesticated mammal that is sometimes friendly but more often not')
    click_button('Add Definition')
    expect(page).to have_content('a cute domesticated mammal that is sometimes friendly but more often not')
  end
end
