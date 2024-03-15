class FlightsController < ApplicationController
  def index
    @flight = Flight.new
    @airport_options = Airport.all.order(:code).map { |a| [a.code, a.id]}
    @date_options = Flight.where('start_at >= ?', Time.now).pluck(Arel.sql('DISTINCT DATE(start_at) AS date')).sort().map { |date| [date, date] }
    @flight_search_results = nil

    if params[:flight]
      @flight_search_results = Flight.where(flight_query_params).where("DATE(start_at) = ?", params[:flight_date] )
    end
  end

  private
  def flight_query_params
    params.require(:flight).permit(:departure_airport_id, :arrival_airport_id)
  end
end
