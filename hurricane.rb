require 'httparty'
require 'byebug'

class Hurricane
  def initialize
    @response = get_response
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/currenthurricane/view.json")
  end

  def hurricane
    x = 0
    output = ""
    @response["currenthurricane"].each do
     output << @response["currenthurricane"][x]["stormInfo"]["stormName_Nice"]
     output << "\n"
     output << " Latitude: \n"
     output << @response["currenthurricane"][x]["Current"]["lat"].to_s
     output << "\n Longitude: \n"
     output << @response["currenthurricane"][x]["Current"]["lon"].to_s
     output << "\n Wind Speed:\n"
     output << @response["currenthurricane"][x]["Current"]["WindSpeed"]["Mph"].to_s
     output << "MPH\n\n"
     x+=1
    end
    output
   end

end
