# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning database..."
Restaurant.destroy_all
puts "Creating restaurants..."

CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]

def create_valid_restaurant
  loop do
    restaurant = build_fake_restaurant
    return restaurant if restaurant.valid?
  end
end

def build_fake_restaurant
  Restaurant.new(
    name: Faker::Restaurant.name,
    adress: Faker::Address.street_address,
    phone_number: '+33' + Faker::Number.number(digits: 9).to_s,
    category: CATEGORIES.sample
  )
end

# Créez plusieurs restaurants valides
5.times do
  create_valid_restaurant.save
end
puts "Finished!"
