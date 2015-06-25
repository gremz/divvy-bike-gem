require 'minitest/autorun'
require 'divvy_bike'

class DivvyBikeTest < Minitest::Test
  def test_get_dont_allow_invalid_arguments
    assert_equal "bikes is not a valid argument",
      DivvyBike.get(:bikes => 5)
  end

  def test_get_correct_json_data
    assert_equal 2,
      DivvyBike.get(:id => 2)[0]["id"]
  end

  def test_have_available_bikes
    assert DivvyBike.have_available_bikes[0]["availableBikes"] > 0
  end

  def test_have_available_docks
    assert DivvyBike.have_available_docks[0]["availableDocks"] > 0
  end
end