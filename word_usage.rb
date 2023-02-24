# https://developer.wordnik.com/docs#!/word/getDefinitions
api_key = "YOURAPIKEY"
require "http"

while true
  system "clear"
  puts "COMPARE WORDS"
  puts "Type 'Q' if you would like to exit otherwise type 'Y': "
  start = gets.chomp
  if start.upcase == "Q"
    break
  end

  puts "Enter two words to compare: "

  user_entries = []
  2.times do
    word = gets.chomp
    user_entries << word
  end

  puts "Start Year: "
  start_year = gets.chomp.to_i
  puts "End Year: "
  end_year = gets.chomp.to_i

  responses = []
  i = 0
  2.times do
    word = HTTP.get("https://api.wordnik.com/v4/word.json/#{user_entries[i]}/frequency?useCanonical=false&startYear=#{start_year}&endYear=#{end_year}&api_key=#{api_key}")
    word = word.parse(:json)
    i += 1
    responses << word
  end

  i = start_year
  k = 0
  while i <= end_year
    p "In #{responses[0]["frequency"][k]["year"]} #{user_entries[0]} was used #{responses[0]["frequency"][k]["count"]} and #{user_entries[1]} was used #{responses[1]["frequency"][k]["count"]}"
    i += 1
    k += 1
  end
end
