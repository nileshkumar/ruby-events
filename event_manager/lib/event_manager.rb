require "csv"

puts "EventManager Initialized!"

content = File.read "event_attendees.csv" if File.exist? "event_attendees.csv"
lines = File.readlines "event_attendees.csv"

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

lines.each do |line|
  next if line == " ,RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode\n"
  puts line.split(",")[2]
end

lines.each_with_index do |line, index|
  next if index == 0
  puts line.split(",")[2]
end

contents.each do |line|
  puts line[:first_name]
end
