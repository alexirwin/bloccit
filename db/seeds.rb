# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

 # Create Users
 5.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10)
   )
   user.skip_confirmation!
   user.save!
 end
 users = User.all
 
 # Note: by calling `User.new` instead of `create`,
 # we create an instance of User which isn't immediately saved to the database.
 
 # The `skip_confirmation!` method sets the `confirmed_at` attribute
 # to avoid triggering an confirmation email when the User is saved.
 
 # The `save` method then saves this User to the database.

 # Create Posts
 # Create Topics
 10.times do
   Topic.create!(
     name:         Faker::Lorem.sentence,
     description:  Faker::Lorem.paragraph
   )
 end
 topics = Topic.all

 50.times do 
 Post.create!(
 	user: users.sample,
  topic:  Topic.first,
 	title: 	Faker::Lorem.sentence,
 	body: 	Faker::Lorem.paragraph
 	)
end
posts =Post.all

#Create Comments
100.times do
	Comment.create!(
		#user: users.sample,
		post: posts.sample,
		body: Faker::Lorem.paragraph
	)
end



# # Create an admin user
#  admin = User.new(
#    name:     'Admin User',
#    email:    'admin@example.com',
#    password: 'helloworld',
#    role:     'admin'
#  )
#  admin.skip_confirmation!
#  admin.save!
 
#  # Create a moderator
#  moderator = User.new(
#    name:     'Moderator User',
#    email:    'moderator@example.com',
#    password: 'helloworld',
#    role:     'moderator'
#  )
#  moderator.skip_confirmation!
#  moderator.save!
 
#  # Create a member
#  member = User.new(
#    name:     'Member User',
#    email:    'member@example.com',
#    password: 'helloworld'
#  )
#  member.skip_confirmation!
#  member.save!

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Topic.count} topics created"