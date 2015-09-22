require 'httparty'
require 'json'
require './condition'
require './forecast'
require './sunrise'
require './alert'
require './hurricane'

puts "Where would you like to find the weather? Enter zip code: "
zipcode = gets.chomp
my_weather=Condition.new(zipcode)

puts "Your weather summary: "
puts my_weather.display_location
puts my_weather.observation_time
puts my_weather.weather
puts my_weather.temperature_string
puts my_weather.humidity
puts "Your 10 day forecast: "
my_forecast=Forecast.new(zipcode)
puts my_forecast.tenday
my_sunrise=Sunrise.new(zipcode)
puts "Your sunrise: "
puts my_sunrise.sunrise
puts "Your sunset: "
puts my_sunrise.sunset
my_alert=Alert.new(zipcode)
puts my_alert.alert
my_hurricane=Hurricane.new
puts "Hurricanes of the world: "
puts my_hurricane.hurricane
