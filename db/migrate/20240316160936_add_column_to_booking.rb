class AddColumnToBooking < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :user_id, :bigint
    remove_column :bookings, :passenger_id, :bigint
  end
end
