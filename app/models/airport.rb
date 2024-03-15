class Airport < ApplicationRecord
  has_many :departing_flights, foreign_key: "deprature_airport", class_name: "Flight"
  has_many :arriving_flights, foreign_key: "arrival_airport", class_name: "Flight"

end
