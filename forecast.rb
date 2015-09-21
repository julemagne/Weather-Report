require 'httparty'
require 'byebug'

class Forecast
  def initialize(zipcode)
    @zipcode = zipcode
    @response = get_response
  end

  def tenday
    x = 0
    output = ""
    until x==20 do
      output<<@response["forecast"]["txt_forecast"]["forecastday"][x]["title"]+":\n"+@response["forecast"]["txt_forecast"]["forecastday"][x]["fcttext"]+"\n\n"
      x+=2
    end
    output
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/forecast10day/q/#{@zipcode}.json")
  end





end
