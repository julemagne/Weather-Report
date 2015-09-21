require 'httparty'
require 'json'
require './condition'

puts "Where would you like to find the weather? Enter zip code: "
zipcode = gets.chomp


puts "Your weather summary: "
puts weather
