require 'rails_helper'

describe 'Users Signup Test', type: :request do
  describe 'invalid signup information' do
    it 'should get users/new as signup page' do
      get signup_path
      expect(request).to render_template('users/new')
    end

    it 'should not create new User' do
      expect do
        post users_path, params: {
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
end