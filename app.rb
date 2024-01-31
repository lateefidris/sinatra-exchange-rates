=begin
require "sinatra"
require "sinatra/reloader"

api_url = "http://api.exchangerate.host/list?access_key=#{ENV["EXCHANGE_RATE_KEY"]}"


get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

=end
require "http"
require "json"

# Available Currencies
api_url = "http://api.exchangerate.host/list?access_key=#{ENV["EXCHANGE_RATE_KEY"]}"

raw_api = HTTP.get(api_url)
parsed_api = JSON.parse(raw_api)
raw_currencies =  parsed_api.fetch("currencies")

currencies = raw_currencies.values
currency_abbr = raw_currencies.keys


# Currency Converter
currency_to = "USD"
currency_from = "INR"
amount = "4"
convert_url = "http://api.exchangerate.host/convert?access_key=#{ENV["EXCHANGE_RATE_KEY"]}&from=#{currency_from}&to=#{currency_to}&amount=#{amount}"

raw_convert_api = HTTP.get(convert_url)
parsed_convert_api = JSON.parse(raw_convert_api)

pp parsed_convert_api.fetch("result")
