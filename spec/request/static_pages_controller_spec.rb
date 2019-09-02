require 'rails_helper'

describe StaticPagesController do
  before do
    @base_title = 'Ruby on Rails Tutorial Sample App'
  end

  describe 'static pages', type: :request do
    it 'should get home' do
      get static_pages_home_url
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Home | #{@base_title}")
    end

    it 'should get help' do
      get static_pages_help_url
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Help | #{@base_title}")
    end

    it 'should get about' do
      get static_pages_about_url
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("About | #{@base_title}")
    end
  end
end