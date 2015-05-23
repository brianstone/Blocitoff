require 'faker'

5.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
  users = User.all

  10.times do
    Item.create!(
      user: users.sample,
      task: Faker::Lorem.sentence
      )
  end
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} tasks created"