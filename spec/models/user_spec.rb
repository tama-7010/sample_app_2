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

  it 'should be valid if user model acceptes valid addresses' do
    valid_addresses = %w[user@example.com User@foo.COM A_US-ES@foo.bar.org
                      first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      expect(@user).to be_valid, "#{valid_address.inspect} should be valid"
    end
  end

  it 'should reject if user model acceptes invalid addresses' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                        foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      expect(@user).not_to be_valid, "#{invalid_address.inspect} should be invalid"
    end
  end

  it 'email address is should be unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    expect(duplicate_user).not_to be_valid
  end
end