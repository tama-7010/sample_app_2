require 'rails_helper'

describe UsersController, type: :feature do
  before do
    @user = FactoryBot.create(:michael)
    @other_user = FactoryBot.create(:archer)
  end

  it 'should redirect index when not logged in' do
    visit users_path
    expect(current_path).to eq login_path
  end

  it 'should get users new (signup)' do
    visit signup_path
    expect(page).to have_http_status(:ok)
  end
end