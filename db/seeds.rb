require 'faker'

5.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

20.times do
    Item.create!(
        name: Faker::Company.bs,
        user: users.sample
    )
end

standard = User.create!(
  email: 'helloworld@gmail.com',
  password: 'helloworld',
)
  standard.skip_confirmation!
  standard.save!

  puts "Seeds finished"
  puts "#{User.count} users created"
  puts "#{Item.count} items created"
