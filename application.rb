require 'httparty'
require 'json'
require './condition'

puts "Where would you like to find the weather? Enter zip code: "
zipcode = gets.chomp
my_weather=Condition.new(zipcode)

puts "Your weather summary: "
puts "#{my_weather.display_location}"
puts my_weather.observation_time
puts my_weather.weather
puts my_weather.temperature_string
puts my_weather.humidity
