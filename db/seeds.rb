require 'faker'

10.times do
  User.create(email: Faker::Internet.email, username: Faker::Internet.user_name, password: 'password')
end
