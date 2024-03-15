class FlightsController < ApplicationController
  def index
    @flight = Flight.new
    @airport_options = Airport.all.order(:code).map { |a| [a.code, a.id]}
    @date_options = Flight.where('start_at >= ?', Time.now).pluck(Arel.sql('DISTINCT DATE(start_at) AS date')).sort().map { |date| [date, date] }
    @number_of_seats = 1
    
    if params[:flight]
      @flight_search_results = Flight.where(flight_query_params).where("DATE(start_at) = ?", params[:flight_date] ).order(:start_at).includes([:departure_airport, :arrival_airport])
      @flight = Flight.new(flight_query_params)
      @number_of_seats = params[:number_of_seats]
      @flight_date = params[:flight_date]
      @booking = Booking.new
    end
  end

  private
  def flight_query_params
    params.require(:flight).permit(:departure_airport_id, :arrival_airport_id)
  end
end
