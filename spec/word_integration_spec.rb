require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the add-word path', {:type => :feature}) do
  it('adds the user-inputted string to a list of words on the home page') do
    visit('/')
    fill_in('inputted_word', :with=> 'Cat')
    click_button('Add Word')
    expect(page).to have_content('Cat')
  end
end
