require 'rails_helper'

describe 'Users index test', type: :request do

  before do
    @user = FactoryBot.create(:michael)
    FactoryBot.create_list(:user, 30)
  end

  it 'index including pagination' do
    post login_path(@user), params: {
      session: {
        email: @user.email,
        password: @user.password,
        remember_me: '1'
      }
    }
    get users_path
    expect(response).to render_template('users/index')
    expect(response.body).to include('pagination')
    User.paginate(page: 1).each do |user|
      expect(response.body).to include("href=\"#{user_path(user)}\"")
    end
  end
end
