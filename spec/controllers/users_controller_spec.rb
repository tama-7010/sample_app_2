require 'rails_helper'

describe UsersController, type: :feature do
  it 'should get users new (signup)' do
    visit signup_path
    expect(page).to have_http_status(:ok)
  end
end