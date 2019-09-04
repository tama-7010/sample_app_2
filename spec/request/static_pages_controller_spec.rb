require 'rails_helper'

describe StaticPagesController do
  before do
    @base_title = 'Ruby on Rails Tutorial Sample App'
  end

  describe 'static pages', type: :feature do
    it 'should get root' do
      visit root_url
      expect(page).to have_http_status(:ok)
    end

    it 'should get home' do
      visit static_pages_home_url
      expect(page).to have_http_status(:ok)
      expect(page).to have_title("#{@base_title}")
    end

    it 'should get help' do
      visit static_pages_help_url
      expect(page).to have_http_status(:ok)
      expect(page).to have_title("Help | #{@base_title}")
    end

    it 'should get about' do
      visit static_pages_about_url
      expect(page).to have_http_status(:ok)
      expect(page).to have_title("About | #{@base_title}")
    end

    it 'should get contact' do
      visit static_pages_contact_url
      expect(page).to have_http_status(:ok)
      expect(page).to have_title("Contact | #{@base_title}")
    end
  end
end