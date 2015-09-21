require 'minitest/autorun'
require 'minitest/pride'
require 'httparty'
require 'json'
require './condition'


class Condition
  private def get_response
      file=File.read('27703.json')
      JSON.parse(file)
  end
end

class ConditionTest < Minitest::Test

  def test_weather_summary_weather
    assert_equal "Overcast", Condition.new('27703').weather
  end



end
