# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

%w(ATL PEK DXB LAX ORD LHR HND HKG PVG CDG AMS DFW CAN FRA IST DEL CGK SIN ICN DEN BKK JFK KUL SFO MAD CTU LAS BCN BOM YYZ SEA CLT LGW SZX TPE MEX KMG MUC MCO MIA PHX SYD EWR MNL SHA XIY FCO IAH NRT SVO CKG DMK MSP GRU BOS SGN DOH HGH DTW JED MEL FLL ORL SAW BOG DME CJU LGA PHL DUB ZRH CPH KIX PMI MAN OSL LIS ARN BWI AYT STN NKG GMP BLR RUH BRU DUS XMN VIE CGO SLC YVR DCA CSX AUH CUN FUK TAO BNE WUH).each do |airport_code|
  Airport.find_or_create_by(code: airport_code)
end
# Create 100 random flights 
# 100.times do
#   two_airports = Airport.order("RANDOM()").limit(2)
#   departure, arrival = two_airports
#   random_seconds = rand(15*24*60) * 60
#   go_back_seven_days = 7*24*60*60
#   random_start = Time.now - go_back_seven_days + random_seconds
#   random_duration = rand(60..360) 
#   Flight.create(
#     start_at: random_start,
#     duration: random_duration,
#     departure_airport_id: departure.id,
#     arrival_airport_id: arrival.id
#   )
# end