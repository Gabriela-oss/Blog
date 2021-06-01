# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  email:'gaby@example.com',
  password:'123123',
  password_confirmation:'123123',
  admin: true
)

25.times do |i|
  post = Post.new
  post.title = Faker::Lorem.sentence(word_count: 3, random_words_to_add: 7)
  post.body = Faker::Lorem.paragraph_by_chars(number: 1500)
  post.user = User.first
  post.image.attach(io: open("https://picsum.photos/1920/1080"), filename: "#{i}_image.jpg")
  post.photo.attach(io: open("https://picsum.photos/1920/1080"), filename: "#{i}_photo.jpg")
  post.views = Faker::Number.between(from: 1, to: 5000)
  post.save
end