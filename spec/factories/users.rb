FactoryBot.define do
  factory :michael, class: User do
    name { 'Michael Example' }
    email { 'michael@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
    # password_digest { User.digest('password') }
  end

  factory :archer, class: User do
    name { 'Sterling Archer' }
    email { 'duchess@example.gov' }
    password { 'password' }
    password_confirmation { 'password' }
    # password_digest { User.digest('password') }
  end

  factory :user do
    sequence(:name) { |n| "User #{n}" }
    sequence(:email) { |n| "user-#{n}@example.com" }
    password { 'password' }
    password_digest { 'password' }
  end
end