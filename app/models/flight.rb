class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  def start_at_formatted
    start_at.strftime("%H-%M - %m/%d/%Y")
  end
end
