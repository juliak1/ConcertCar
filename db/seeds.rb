# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

location = [
"Gdynia",
"Gdansk",
"Sopot",
]

User.where(email: "user@user.com").first_or_create(name: "Jan Kowalski", email: "user@user.com", password: "user")
User.where(email: "admin@admin.com").first_or_create(name: "Admin", email: "admin@admin.com", password: "admin", admin: true)

10.times do
	User.create(name:Faker::GameOfThrones.name, email: Faker::Internet.email, password: "12345")
end


100.times do
	Offer.create(concert: Faker::GameOfThrones.city,
				 description: Faker::Lorem.paragraph(2),
				 route: location.sample,
				 price: rand(20..200),
				 location: location.sample,
				 user_id: 1,
				 )
end