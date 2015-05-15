require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('add band form path', :type => :feature) do
  it('will allow user to add band through form and returns new band on bands page') do
    visit('/bands/form')
    fill_in('name', :with => 'Radiohead')
    click_button('Add Band')
    expect(page).to have_content('Radiohead')
  end
end
