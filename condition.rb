require 'httparty'
require 'byebug'

class Condition
  def initialize(zipcode)
    @zipcode = zipcode
    @response = get_response
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/conditions/q/#{zipcode}.json")
  end

  def weather
    @response["current_observation"]["weather"]
  end
end
