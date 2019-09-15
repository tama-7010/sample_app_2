require 'rails_helper'

describe 'users session', type: :feature do
  it 'login with invalid information' do
    visit login_path
    click_button 'Log in'
    expect(page).to have_css(".alert-danger")
    visit root_path
    expect(page).not_to have_css(".alert-danger")
  end
end