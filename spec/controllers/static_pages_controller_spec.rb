require 'rails_helper'

describe StaticPagesController, type: :feature do
  before do
    @base_title = 'Ruby on Rails Tutorial Sample App'
  end

  it 'should get root' do
    visit root_path
    expect(page).to have_http_status(:ok)
    expect(page).to have_title("#{@base_title}")
  end

  it 'should get help' do
    visit help_path
    expect(page).to have_http_status(:ok)
    expect(page).to have_title("Help | #{@base_title}")
  end

  it 'should get about' do
    visit about_path
    expect(page).to have_http_status(:ok)
    expect(page).to have_title("About | #{@base_title}")
  end

  it 'should get contact' do
    visit contact_path
    expect(page).to have_http_status(:ok)
    expect(page).to have_title("Contact | #{@base_title}")
  end
end