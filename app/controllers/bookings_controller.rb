class BookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    if !params[:booking]
      @booking = Booking.new
    else
      @booking = Booking.new(after_search_booking_params)
      @flight = Flight.find(params[:booking][:flight_id])
      @num_passengers = params[:number_of_passengers].to_i
      @num_passengers.times do
        @booking.tickets.build.build_passenger
      end
    end
  end

  def create
    @flight = Flight.find(params[:booking][:flight_id])
    @booking = current_user.bookings.build(booking_params)
    if @booking.save
      @booking.passengers.each do |passenger|
        PassengerMailer.booking_success(@booking, passenger).deliver_now
      end
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    
    @booking = Booking.find(params[:id])
    if @booking.user != current_user
      redirect_to root_path
    end
  end

  private

  def after_search_booking_params
    params.require(:booking).permit(:flight_id)
  end

  def booking_params
    params.require(:booking).permit(:flight_id, :user_id, tickets_attributes: [passenger_attributes: [:id, :name, :email]])
  end
end
