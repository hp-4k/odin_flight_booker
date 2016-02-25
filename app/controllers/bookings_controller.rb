class BookingsController < ApplicationController
  
  def new
    unless params[:flight_id]
      flash[:error] = "You have not selected a flight."
      redirect_to session.delete(:return_to) and return
    end
    
    flight = Flight.find(params[:flight_id])  
    @booking = flight.bookings.build
    params[:passengers].to_i.times do
      @booking.passengers.build      
    end
  end
  
  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      send_confirmation_emails
      redirect_to @booking
    else
      flash.now[:error] = "All fields are required."
      render :new
    end
  end
  
  
  def show
    @booking = Booking.find(params[:id])
  end
  
  private
  
    def booking_params
      params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
    end
    
    def send_confirmation_emails
      flight = Flight.find(params[:booking][:flight_id])
      params[:passengers].to_i.times do |i|
        passenger_name = params[:booking][:passengers_attributes][i.to_s][:name]
        passenger_email = params[:booking][:passengers_attributes][i.to_s][:email]
        PassengerMailer.thank_you_email(flight, passenger_name, passenger_email).deliver
      end
    end
    
end
