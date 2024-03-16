class BookingsController < ApplicationController
  def new
    if !params[:booking]
      @booking = Booking.new
      @passengers_array = [Passenger.new]
    else
      @booking = Booking.new(after_search_booking_params)
      @flight = Flight.find(params[:booking][:flight_id])
      @passengers_array = []
      for i in 1..params[:number_of_passengers].to_i do
        @passengers_array << Passenger.new
      end
    end
  end

  private

  def after_search_booking_params
    params.require(:booking).permit(:flight_id)
  end
end
