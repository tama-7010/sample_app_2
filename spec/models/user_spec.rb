require 'rails_helper'

describe User, type: :feature do
  before do
    @user = User.new(name: 'Example User', email: 'user@example.com')
  end

  it 'should be valid if a user model is exact info' do
    expect(@user.valid?).to be_truthy
  end

  it 'should be false if name is not present' do
    @user.name = "   "
    expect(@user.valid?).to be_falsy
  end

  it 'should be false if name have 51 charcters or more' do
    @user.name = "a" * 51
    expect(@user.valid?).to be_falsy
  end

  it 'should be false if email is not present' do
    @user.email = "   "
    expect(@user.valid?).to be_falsy
  end

  it 'should be false if email have 256 charcters or more' do
    @user.email = "a" * 244 + "@example.com"
    expect(@user.valid?).to be_falsy
  end
end