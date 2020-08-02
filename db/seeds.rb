# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Reservation.destroy_all
Accomodation.destroy_all
City.destroy_all

#--------------------------------
# Helper Methods
def get_zip_code
  return rand(0..8).to_s + rand(0..9).to_s + rand(100..999).to_s
end

def create_phone_number
  return "0033" + rand(100000000..999999999).to_s
end

# def create_phone_number
#   return "0033" + rand(0..9).to_s + rand(0..9).to_s + rand(0..9).to_s + rand(0..9).to_s + rand(0..9).to_s + rand(0..9).to_s + rand(0..9).to_s + rand(0..9).to_s + rand(0..9).to_s
# end

#--------------------------------

20.times do |i|
  City.create(name: Faker::Address.city, 
    zip_code: get_zip_code)
end
puts "Create Cities tables done!"


# puts create_phone_number

20.times do |i|
  user_list = User.create(name: Faker::Name.name, 
    email: Faker::Internet.email,
     phone: create_phone_number, 
     description: Faker::ChuckNorris.fact)
end
puts "Create Users tables done!"

50.times do |i|
  accomodation_list = Accomodation.create(
    availlable_beds: rand(1..10), 
    price_per_night: rand(10..1000),
    description: Faker::Lorem.sentence(word_count: 50), 
    welcome_text: Faker::ChuckNorris.fact, 
    city: City.all.sample, 
    host: User.all.sample, 
    has_wifi: [true, false].sample)
end
puts "Create Accomodations tables done!"