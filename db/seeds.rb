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
# Create topics
10.times do
  topic = Topic.create!(
    title: Faker::Lorem.word)
end
topics = Topic.all

# Create Bookmarks
50.times do
  bookmark = Bookmark.create(
    url: Faker::Internet.url,
    topic: topics.sample,
    user: users.sample)
end
bookmarks = Bookmark.all

puts "Seeds finished"
puts "#{User.count} users created" 
puts "#{Topic.count} topics created"
puts "#{bookmarks.count} bookmarks created"
