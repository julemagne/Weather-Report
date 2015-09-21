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

  def test_display_location
    assert_equal "Durham North Carolina 27703", Condition.new('27703').display_location
  end

  def test_observation_time
    assert_equal "Last Updated on September 21, 1:34 PM EDT", Condition.new('27703').observation_time
  end

  def test_weather_summary_weather
    assert_equal "Overcast", Condition.new('27703').weather
  end

  def test_temperature_string
    assert_equal "75.6 F (24.2 C)", Condition.new('27703').temperature_string
  end

  def test_humidity
    assert_equal "72%", Condition.new('27703').humidity
  end
end
