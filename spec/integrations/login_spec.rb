require 'spec_helper'

feature "user login process" do
  let(:user) { User.create(email: 'me@example.com', password: 'foobar') }

  scenario "an existing user logs in" do
    visit new_login_url
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Login'
    expect(page.body).to have_content("Welcome, #{user.email}!")
  end

  scenario "an existing user attempts to login with a bad password" do
    visit new_login_url
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: 'password'
    click_button 'Login'
    expect(page.body).to have_content('Bad Login!')
  end

  scenario "a non-existant user attempt to login" do
    visit new_login_url
    fill_in 'user[email]', with: 'you@example.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Login'
    expect(page.body).to have_content('Bad Login!')
  end
end
