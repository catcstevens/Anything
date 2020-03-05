# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = ["DIY", "camping", "kids", "hobbies", "gardening", "cooking", "furniture", "instruments"]

for i in categories
    Category.create(name: i)
    puts "created #{i} categories"
end

for i in 1..5
    User.create(
        username: "username#{i}",
        email: "#{i}@test.com",
        password: "123456"
    )
    puts "created #{i} users"
end