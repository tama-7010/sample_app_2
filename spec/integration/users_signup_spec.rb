require 'rails_helper'

describe 'Users Signup Test', type: :request do
  describe 'invalid signup information' do
    it 'should not create new User' do
      expect do
        post signup_path, params: {
          user: {
            name: '',
            email: 'user@invalid',
            password: 'foo',
            password_confirmation: 'bar'
          }
        }
      end.to change { User.count }.by(0)
    end
  end

  describe "valid signup information" do
    it 'should be create new User' do
      expect do
        post signup_path, params: {
          user: {
            name: 'Example User',
            email: 'user@example.com',
            password: 'password',
            password_confirmation: 'password'
          }
        }
      end.to change { User.count }.by(1)
      # expect(response).to redirect_to({ action: :show, id: assigns(:user).id })
      follow_redirect!
      # expect(response.body).to include('alert alert-success')
    end
  end
end