require "http"
require "json"
require "sinatra"
require "sinatra/reloader"

# Available Currencies
api_url = "http://api.exchangerate.host/list?access_key=#{ENV["EXCHANGE_RATE_KEY"]}"

raw_api = HTTP.get(api_url)
parsed_api = JSON.parse(raw_api)
raw_currencies =  parsed_api.fetch("currencies")

@currencies = raw_currencies.values
@currency_abbr = raw_currencies.keys

# Home Screen

get("/") do
  api_url = "http://api.exchangerate.host/list?access_key=#{ENV["EXCHANGE_RATE_KEY"]}"

  raw_api = HTTP.get(api_url)
  parsed_api = JSON.parse(raw_api)
  raw_currencies =  parsed_api.fetch("currencies")
  @currencies = raw_currencies.values
  @currency_abbr = raw_currencies.keys
 erb(:homescreen)
end

# Template Screen 

get("/:first_currency") do
  @currencies = raw_currencies.values
  @currency_abbr = raw_currencies.keys
  erb(:template)
end

# Conversion Screen

get("/:first_currency/:second_currency") do
  currency_from = params.fetch("first_currency")
  currency_to = params.fetch("second_currency")
  amount = "1"
  convert_url = "http://api.exchangerate.host/convert?access_key=#{ENV["EXCHANGE_RATE_KEY"]}&from=#{currency_from}&to=#{currency_to}&amount=#{amount}"

  raw_convert_api = HTTP.get(convert_url)
  parsed_convert_api = JSON.parse(raw_convert_api)

  @converted =  parsed_convert_api .fetch("result")


  @currencies = raw_currencies.values
  @currency_abbr = raw_currencies.keys

  erb(:conversion)
end
