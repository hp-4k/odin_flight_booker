airports = %w{ lhr cdg txl bcn waw vie osl fco }

File.open('flight_seeds.txt', 'w') do |file|
  
  1000.times do 
    
    airport_from, airport_to = airports.shuffle[0..1]
    time_offset_in_minutes = Random.rand(0..672) * 15
    duration_in_minutes = Random.rand(8..16) * 15
    
    file.puts("#{airport_from}.departing_flights.create(to_id: #{airport_to}.id, "\
              "duration: #{duration_in_minutes}, "\
              "start: Time.now + #{time_offset_in_minutes}.minutes)")
    
  end
  
end