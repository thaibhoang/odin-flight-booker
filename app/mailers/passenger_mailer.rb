class PassengerMailer < ApplicationMailer
  
  def booking_success(booking, passenger)
    @passenger = passenger
    @booking = booking
    mail(to: @passenger.email, subject: "Your ticket has been booked successfully")
  end

end
