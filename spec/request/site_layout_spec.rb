require 'rails_helper'

describe 'Site layout test', type: :feature do
  include ApplicationHelper
  it 'should have some links in root page' do
    visit root_path
    expect(current_path).to eq root_path
    expect(page).to have_selector "a[href='#{root_path}']", count: 2
    expect(page).to have_selector "a[href='#{help_path}']"
    expect(page).to have_selector "a[href='#{about_path}']"
    expect(page).to have_selector "a[href='#{contact_path}']"
  end

  it 'should have specific title in Contact page' do
    visit contact_path
    expect(page).to have_title(full_title("Contact"))
  end
end