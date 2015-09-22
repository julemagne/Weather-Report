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
      x=0
      output=""
      output << "Alerts in your area: "
      @response["alerts"].each do
         output << @response["alerts"][x]["description"]
         output << @response["alerts"][x]["message"]
         x+=1
       end
       output
    else
      "\nThere are no alerts in your area.\n\n"
    end
  end

end
