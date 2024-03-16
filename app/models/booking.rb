class Booking < ApplicationRecord
  belongs_to :passenger
  belongs_to :flight
  belongs_to :user

  accepts_nested_attributes_for :passenger
end
