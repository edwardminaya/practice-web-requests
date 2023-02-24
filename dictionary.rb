# https://developer.wordnik.com/docs#!/word/getDefinitions
api_key = "YOURAPIKEY"
require "HTTP"

while true
  system "clear"

  puts "Enter a word: "

  input_word = gets.chomp
  response = HTTP.get ("https://api.wordnik.com/v4/word.json/#{input_word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=#{api_key}")

  definitions = response.parse(:json)

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/examples?includeDuplicates=false&useCanonical=false&limit=5&api_key=#{api_key}")
  examples = response.parse(:json)

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/pronunciations?useCanonical=false&limit=50&api_key=#{api_key}")

  pronunciations = response.parse(:json)

  pp definitions[1]["text"]
  pp examples["examples"][0]["text"]
  pp pronunciations[0]["raw"]

  puts "Enter 'Q' to quite or any other key to continue: "
  input_option = gets.chomp
  if input_option.upcase == "Q"
    puts "Thank you, Goodbye!"
    break
  end
end
