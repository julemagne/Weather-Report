require 'httparty'
require 'byebug'

class Condition
  def initialize(zipcode)
    @zipcode = zipcode
    @response = get_response
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/conditions/q/#{@zipcode}.json")
  end

  def display_location
    @response["current_observation"]["display_location"]["city"] +" "+ @response["current_observation"]["display_location"]["state_name"] +" "+ @response["current_observation"]["display_location"]["zip"]
  end

  def observation_time
    @response["current_observation"]["observation_time"]
  end

  def weather
    @response["current_observation"]["weather"]
  end

  def temperature_string
    @response["current_observation"]["temperature_string"]
  end

  def humidity
    @response["current_observation"]["relative_humidity"]
  end
end
