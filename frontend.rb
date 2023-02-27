require "http"

system "clear"
puts "Choose an option:"
puts "[1] Random Fortune:"
puts "[2] Lotto numbers:"
puts "[3] Page Visits Counter:"

input_options = gets.chomp

if input_options == "1"
  response = HTTP.get("http://localhost:3000/fortune")
  fortune = response.parse["fortune"]
  puts fortune
elsif input_options == "2"
  response = HTTP.get("http://localhost:3000/number")
  number = response.parse
  puts number
elsif input_options == "3"
  response = HTTP.get("http://localhost:3000/number_visits")
  count = response.parse["count"]
  puts "number of visits #{count}"
end
