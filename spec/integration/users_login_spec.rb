require 'rails_helper'

describe 'users session', type: :feature do
  before do
    @user = FactoryBot.create(:michael)
  end

  it 'login with invalid information' do
    visit login_path
    click_button 'Log in'
    expect(page).to have_css(".alert-danger")
    visit root_path
    expect(page).not_to have_css(".alert-danger")
  end

  it 'login with valid information followed by logout' do
    visit login_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    expect(current_path).to eq user_path(@user)
    expect(page).not_to have_selector("a[href='#{login_path}']")
    expect(page).to have_selector("a[href='#{logout_path}']")
    expect(page).to have_selector("a[href='#{user_path(@user)}']")
    click_on 'Account'
    click_on 'Log out'
    expect(page).to have_selector("a[href='#{login_path}']")
    expect(page).not_to have_selector("a[href='#{logout_path}']")
    expect(page).not_to have_selector("a[href='#{user_path(@user)}']")
  end
end