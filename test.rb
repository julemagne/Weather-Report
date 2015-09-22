require 'minitest/autorun'
require 'minitest/pride'
require 'httparty'
require 'json'
require './condition'
require './forecast'
require './sunrise'
require './alert'
require './hurricane'

class Condition
  private def get_response
    file=File.read('27703.json')
    JSON.parse(file)
  end
end

class Forecast
  private def get_response
    file=File.read('2770310day.json')
    JSON.parse(file)
  end
end

class Sunrise
  private def get_response
    file=File.read('27703sunrise.json')
    JSON.parse(file)
  end
end

class Alert
  private def get_response
   file=File.read('85701alert.json')
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
    assert_equal "72% humidity", Condition.new('27703').humidity
  end

  def test_10_day
    mon = Forecast.new('27703')
    assert_equal "Monday:", mon.tenday.split[0]
  end

  def test_sunrise
    assert_equal "7:02", Sunrise.new('27703').sunrise
  end

  def test_sunset
    assert_equal "19:14", Sunrise.new('27703').sunset
  end

  def test_alert
    assert_equal "Alerts", Alert.new('85701').alert.split[0]
  end

  def test_hurricane
    assert_equal "Tropical", Hurricane.new.hurricane.split[0]
  end
end
