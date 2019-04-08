
require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do

  scenario 'has a new user page' do 
    visit new_user_url #same as new_user_path ?
    expect(page).to have_content 'Create New User!'
  end

  feature 'signing up a user' do

    before(:each) do
      visit new_user_url
      fill_in 'Username:', with: 'Jojo'
      fill_in 'Password:', with: 'password' 
      click_on 'Create New User!'
    end
  
    scenario 'redirects to user show page after signup' do
      expect(page).to have_content 'User Info:'
      expect(page).to have_content 'Username:'
    end

  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do  

  end

end

feature 'logging out' do
  scenario 'begins with a logged out state' do    
  end

  scenario 'doesn\'t show username on the homepage after logout' do   
  end

end