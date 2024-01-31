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

pp currency_abbr

# Currency Converter

