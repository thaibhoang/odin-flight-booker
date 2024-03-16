class Booking < ApplicationRecord
  has_many :passengers, through: :tickets, source: :passenger
  has_many :tickets, inverse_of: :booking
  belongs_to :flight
  belongs_to :user

  accepts_nested_attributes_for :tickets
  accepts_nested_attributes_for :passengers
end
