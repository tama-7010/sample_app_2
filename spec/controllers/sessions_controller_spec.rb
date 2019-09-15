require 'rails_helper'

describe SessionsController, type: :feature do
  it 'should get new' do
    visit login_path
    expect(page).to have_http_status(:ok)
  end
end