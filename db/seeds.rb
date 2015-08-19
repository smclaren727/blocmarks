require 'faker'

# Create Users
5.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save!
end

# Create a test account
sean = User.new(
  email: 'sean@example.com',
  password: 'password'
  )
sean.skip_confirmation!
sean.save!

users = User.all

10.times do
  topic = Topic.create!(
    title: Faker::Lorem.word,
    user: users.sample
  )
end

topics = Topic.all

puts "Seeds finished"
puts "#{User.count} users created" 
puts "#{Topic.count} topics created"
