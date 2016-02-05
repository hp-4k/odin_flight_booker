module FlightsHelper
  
  def duration_from_minutes(minutes)
    (minutes/60).to_s + ':' + (minutes % 60).to_s.rjust(2, '0')
  end
  
end
