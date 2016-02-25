class PassengerMailer < ApplicationMailer
  
  default from: 'bookings@example.com'
  
  def thank_you_email(flight, passenger_name, passenger_email)
    @name = passenger_name
    @flight = flight
    mail(to: passenger_email, subject: "Flight no. #{flight.id} booking confirmation")
  end
  
end
