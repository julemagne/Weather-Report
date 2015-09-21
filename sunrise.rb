require 'httparty'
require 'byebug'

class Sunrise
  def initialize(zipcode)
    @zipcode = zipcode
    @response = get_response
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/astronomy/q/#{@zipcode}.json")
  end

  def sunrise
    @response["sun_phase"]["sunrise"]["hour"] +":"+ @response["sun_phase"]["sunrise"]["minute"]
  end

  def sunset
    @response["sun_phase"]["sunset"]["hour"] +":"+ @response["sun_phase"]["sunset"]["minute"]
  end
end
