require 'httparty'
require 'byebug'

class Alert
  def initialize(zipcode)
    @zipcode = zipcode
    @response = get_response
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/alerts/q/#{@zipcode}.json")
  end

  def alert
    if @response["alerts"]!=[]
      @response["alerts"]
    else
      "There are no alerts in your area."
    end
  end

end
