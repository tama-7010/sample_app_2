require 'rails_helper'

describe 'Users edit test', type: :request do

  before do
    @user = FactoryBot.create(:michael)
    @other_user = FactoryBot.create(:archer)
  end

  it 'should not success to edit' do
    post login_path(@user), params: {
      session: {
        email: @user.email,
        password: @user.password,
        remember_me: '1'
      }
    }
    get edit_user_path(@user)
    expect(response).to render_template('users/edit')
    put user_path(@user), params: {
      user: {
        name: "",
        email: "foo@invalid",
        password: "foo",
        password_confirmation: "bar"
      }
    }
    expect(response).to render_template('users/edit')
  end

  it 'should success to edit with friendly forwading' do
    get edit_user_path(@user)
    post login_path(@user), params: {
      session: {
        email: @user.email,
        password: @user.password,
        remember_me: '1'
      }
    }
    expect(response).to redirect_to(user_url(@user))
    name = "Foo Bar"
    email = "foo@bar.com"
    put user_path(@user), params: {
      user: {
        name: name,
        email: email,
        password: "",
        password_confirmation: ""
      }
    }
    expect(response.body).not_to include('.alert')
    @user.reload
    expect(@user.name).to eq name
    expect(@user.email).to eq email
  end

  it 'should redirect edit when not logged in' do
    get edit_user_path(@user)
    expect(response.body).not_to include('.alert')
    expect(response).to redirect_to(login_path)
  end

  it 'should redirect update when not logged in' do
    put user_path(@user), params: {
      user: {
        name: @user.name,
        email: @user.email
      }
    }
    expect(response.body).not_to include('.alert')
    expect(response).to redirect_to(login_path)
  end

  it 'should redirect edit when logged in as wrong user' do
    post login_path(@other_user), params: {
      session: {
        email: @other_user.email,
        password: @other_user.password,
        remember_me: '1'
      }
    }
    get edit_user_path(@user)
    # expect(response.body).to include('.alert')
    expect(response).to redirect_to(root_path)
  end

  it 'should redirect update when logged in as wrong user' do
    post login_path(@other_user), params: {
      session: {
        email: @other_user.email,
        password: @other_user.password,
        remember_me: '1'
      }
    }
    put user_path(@user), params: {
      user: {
        name: @user.name,
        email: @user.email
      }
    }
    # expect(response.body).to include('.alert')
    expect(response).to redirect_to(root_path)
  end
end
