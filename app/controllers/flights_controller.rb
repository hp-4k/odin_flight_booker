class FlightsController < ApplicationController
  
  def index
    @airports = Airport.all
    
    if params[:from] && params[:to] && params[:date]
      start_date = Time.new(*params[:date].split('-'))
      end_date = start_date + 1.day
      @flights = Flight.where(from_id: params[:from], to_id: params[:to],
                              start: (start_date...end_date))
      session[:return_to] = request.original_url
        
      if @flights.empty?
        dates = Flight.pluck(:start)
        min_date = dates.min.strftime("%d %b %Y")
        max_date = dates.max.strftime("%d %b %Y")
        flash.now[:error] = "Oops, it appears that there are no flights matching"\
        " your criteria. Tip: Make sure you are selecting a date between #{min_date} and"\
        " #{max_date}."
      end
    end
    
  end
  
end
