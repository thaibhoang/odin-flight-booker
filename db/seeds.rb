# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

%w(ATL PEK DXB LAX ORD LHR HND HKG PVG CDG AMS DFW).each do |airport_code|
  Airport.find_or_create_by(code: airport_code)
end
# Create 1000 random flights
1000.times do
  two_airports = Airport.order("RANDOM()").limit(2)
  departure, arrival = two_airports
  random_seconds = rand(15*24*60) * 60
  go_back_seven_days = 7*24*60*60
  random_start = Time.now - go_back_seven_days + random_seconds
  random_duration = rand(60..360) 
  Flight.create(
    start_at: random_start,
    duration: random_duration,
    departure_airport_id: departure.id,
    arrival_airport_id: arrival.id
  )
end