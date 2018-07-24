require 'csv'
require 'erb'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

puts "EventManager initialized."

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter

contents.each do |row|
  fname = row[:first_name]

  full_name = "#{row[:first_name]}" + " #{row[:last_name]}"

  zipcode = clean_zipcode(row[:zipcode])

  form_letter = erb_template.result(binding)

  Dir.mkdir("output") unless Dir.exists? "output"

  filename = "output/thanks_#{fname}.html"

  File.open(filename,'w') do |file|
    file.puts form_letter
  end

end
