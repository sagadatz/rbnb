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

require 'open-uri'
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
    title: "Whispers of Alexanderplatz",
    price: 3200,
    status: 1,
    rooms: 3,
    adress: "Alexanderplatz 10, Berlin",
    description: "An elegant flat with stunning views of Berlin’s historic landmarks.",
    user: users.sample
  },
  {
    title: "Aurora Haven by the Spree",
    price: 2600,
    status: 1,
    rooms: 2,
    adress: "Friedrichstraße 56, Berlin",
    description: "A modern sanctuary bathed in natural light, near the Spree River.",
    user: users.sample
  },
  {
    title: "The Baltic Breeze in Prenzlauer Berg",
    price: 4100,
    status: 1,
    rooms: 4,
    adress: "Unter den Linden 89, Berlin",
    description: "Spacious and inviting, located in the vibrant district of Prenzlauer Berg.",
    user: users.sample
  },
  {
    title: "Mediterranean Horizon on Karl-Marx-Allee",
    price: 4900,
    status: 1,
    rooms: 5,
    adress: "Karl-Marx-Allee 34, Berlin",
    description: "Experience luxury in this villa with a Mediterranean-style garden.",
    user: users.sample
  },
  {
    title: "Moonlight Retreat near Tiergarten",
    price: 3700,
    status: 1,
    rooms: 3,
    adress: "Leipziger Straße 12, Berlin",
    description: "Charming flat with easy access to Berlin's lush Tiergarten park.",
    user: users.sample
  },
  {
    title: "The Emerald Cove in Kreuzberg",
    price: 2800,
    status: 1,
    rooms: 2,
    adress: "Hermannstraße 45, Berlin",
    description: "A cozy retreat in the vibrant Kreuzberg neighborhood.",
    user: users.sample
  },
  {
    title: "Nordic Elegance in Mitte",
    price: 4500,
    status: 1,
    rooms: 4,
    adress: "Schönhauser Allee 67, Berlin",
    description: "A luxurious home blending modernity and timeless charm.",
    user: users.sample
  },
  {
    title: "Canal-Side Dreams in Neukölln",
    price: 3200,
    status: 1,
    rooms: 3,
    adress: "Bergmannstraße 23, Berlin",
    description: "Classic flat offering serene views of Neukölln’s canals.",
    user: users.sample
  },
  {
    title: "Alpine Bliss in Charlottenburg",
    price: 4700,
    status: 1,
    rooms: 5,
    adress: "Oranienstraße 88, Berlin",
    description: "A grand residence located in the upscale Charlottenburg district.",
    user: users.sample
  },
  {
    title: "Sunset Serenity in Schöneberg",
    price: 3000,
    status: 1,
    rooms: 3,
    adress: "Sonnenallee 33, Berlin",
    description: "Relax in this sun-drenched flat with beautiful city views.",
    user: users.sample
  },
  {
    title: "Timeless Elegance near Museum Island",
    price: 2700,
    status: 1,
    rooms: 2,
    adress: "Friedrichstraße 16, Berlin",
    description: "A blend of historic charm and modern amenities near Museum Island.",
    user: users.sample
  },
  {
    title: "Serene Nest in Treptow",
    price: 4200,
    status: 1,
    rooms: 4,
    adress: "Potsdamer Straße 39, Berlin",
    description: "A peaceful retreat surrounded by Treptower Park's natural beauty.",
    user: users.sample
  },
  {
    title: "Golden Glow in Mitte",
    price: 3500,
    status: 1,
    rooms: 3,
    adress: "Kurfürstendamm 91, Berlin",
    description: "Charming flat bathed in sunlight, located in the heart of Mitte.",
    user: users.sample
  },
  {
    title: "Romantic Haven in Friedrichshain",
    price: 2900,
    status: 1,
    rooms: 2,
    adress: "Warschauer Straße 20, Berlin",
    description: "A romantic hideaway in the vibrant district of Friedrichshain.",
    user: users.sample
  },
  {
    title: "Aegean Escape near the Spree",
    price: 3300,
    status: 1,
    rooms: 3,
    adress: "Torstraße 58, Berlin",
    description: "A stylish apartment with calming views of the Spree River.",
    user: users.sample
  },
  {
    title: "Tranquil Waters in Moabit",
    price: 4000,
    status: 1,
    rooms: 4,
    adress: "Tempelhofer Ufer 72, Berlin",
    description: "Elegant canalside living with vibrant charm in Moabit.",
    user: users.sample
  }
])





image_urls = ["https://res.cloudinary.com/dq57wkefg/image/upload/v1732198149/01_Wohnraum-1-1024x683_xkanf0.jpg", "https://res.cloudinary.com/dq57wkefg/image/upload/v1732286440/apartment_s8w6ww.jpg", "https://res.cloudinary.com/dq57wkefg/image/upload/v1732286439/5_jqdhon.jpg", "https://res.cloudinary.com/dq57wkefg/image/upload/v1732286440/apartment_2_vduxcb.jpg", "https://res.cloudinary.com/dq57wkefg/image/upload/v1732286440/apartment_3_aui7xe.jpg", "https://res.cloudinary.com/dq57wkefg/image/upload/v1732286440/apartment_4_poq9gq.jpg", "https://res.cloudinary.com/dq57wkefg/image/upload/v1732286441/apartment_7_jii8ag.jpg", "https://res.cloudinary.com/dq57wkefg/image/upload/v1732286444/apartment_13_cjd2kl.jpg", "https://res.cloudinary.com/dq57wkefg/image/upload/v1732286450/Gorki_Penthouse_1_010_hyelyx.jpg", "https://res.cloudinary.com/dq57wkefg/image/upload/v1732286441/apartment_8_u7fbpr.jpg", "https://res.cloudinary.com/dq57wkefg/image/upload/v1732187990/1000_F_288706739_nO0PgWvNpb9Szi200COJQyWevFaZYqLB_yfipq7.jpg", "https://res.cloudinary.com/dq57wkefg/image/upload/v1732286444/apartment_12_f5tujm.jpg", "https://res.cloudinary.com/dq57wkefg/image/upload/v1732286445/apartment_145_1_jkzdoz.jpg", "https://res.cloudinary.com/dq57wkefg/image/upload/v1732286447/apartment_166_s7jbzk.jpg", "https://res.cloudinary.com/dq57wkefg/image/upload/v1732286447/apartment_1456_l7bqz9.jpg", "https://res.cloudinary.com/dq57wkefg/image/upload/v1732286447/berlinerwcanlage870_kliu5m.jpg"]
#image_file = URI.open("https://res.cloudinary.com/dq57wkefg/image/upload/v1732187989/space_station_b4bkg7.jpg")

Flat.all.each_with_index do |flat, index|
  image_file = URI.open(image_urls[index])
  flat.photo.attach(io: image_file, filename: "#{flat.title}.jpg", content_type: "image/jpg")
end

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
