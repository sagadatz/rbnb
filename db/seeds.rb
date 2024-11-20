# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

# Clear existing data (optional)
Booking.destroy_all
Flat.destroy_all
User.destroy_all
Review.destroy_all

# Create users
users = User.create!([
  { email: "alice@example.com", password: "password123" },
  { email: "bob@example.com", password: "password123" },
  { email: "carol@example.com", password: "password123" },
  { email: "dave@example.com", password: "password123" }
])

puts "Created #{users.count} users."

# Create flats
flats = Flat.create!([
  {
    title: "Cozy Apartment in Berlin",
    price: 80,
    status: 1,
    rooms: 2,
    adress: "123 Main Street, Berlin",
    description: "A beautiful apartment in the heart of Berlin, perfect for tourists.",
    user: users[0]
  },
  {
    title: "Spacious Loft in Hamburg",
    price: 120,
    status: 1,
    rooms: 3,
    adress: "456 Elm Street, Hamburg",
    description: "Modern loft with all amenities in the center of Hamburg.",
    user: users[1]
  },
  {
    title: "Family Home in Munich",
    price: 150,
    status: 1,
    rooms: 4,
    adress: "789 Pine Street, Munich",
    description: "A cozy family home near parks and attractions.",
    user: users[2]
  },
  {
    title: "Luxury Villa in Frankfurt",
    price: 300,
    status: 1,
    rooms: 5,
    adress: "101 Maple Avenue, Frankfurt",
    description: "A luxurious villa with a private pool and garden.",
    user: users[3]
  }
])

puts "Created #{flats.count} flats."

# Create bookings
# bookings = Booking.create!([
#   {
#     flat: flats[0],
#     user: users[1],
#     start_date: Date.today,
#     end_date: (Date.today + 3),
#     status: 1
#   },
#   {
#     flat: flats[1],
#     user: users[2],
#     start_date: (Date.today + 10),
#     end_date: (Date.today + 15),
#     status: 1
#   },
#   {
#     flat: flats[2],
#     user: users[3],
#     start_date: (Date.today + 5),
#     end_date: (Date.today + 7),
#     status: 1
#   }
# ])

# puts "Created #{bookings.count} bookings."

# # Create reviews
# reviews = Review.create!([
#   {
#     booking: bookings[0],
#     rating: 5,
#     comment: "Amazing place! Super clean and comfortable."
#   },
#   {
#     booking: bookings[1],
#     rating: 4,
#     comment: "Great location, but could use some better amenities."
#   },
#   {
#     booking: bookings[2],
#     rating: 3,
#     comment: "The stay was okay, but the host could be more responsive."
#   }
# ])

# puts "Created #{reviews.count} reviews."
