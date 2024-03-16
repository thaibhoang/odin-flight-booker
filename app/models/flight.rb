class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"
  has_many :bookings
  has_many :tickets, through: :bookings, source: :tickets
  has_many :passengers, through: :tickets, source: :passenger

  def flight_detail
    "From: #{departure_airport.code} To: #{arrival_airport.code} Departs at: #{start_at.strftime("%H:%M %d/%m/%Y")}"
  end
end
