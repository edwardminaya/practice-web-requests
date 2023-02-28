require "http"

response = HTTP.get("http://localhost:3000/single_contact")

pp response.parse
