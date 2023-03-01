require "http"
require "tty-table"

response = HTTP.get("http://localhost:3000/all_products.json")

header = ["id", "name", "price", "image", "description"]
table = TTY::Table.new
table << header

response.parse.each do |row|
  table << row.values
end

puts table.render(:unicode)
