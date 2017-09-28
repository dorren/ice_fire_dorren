require 'test_helper'

class StatsControllerTest < ActionDispatch::IntegrationTest
  test "should get birth_year" do
    get stats_birth_year_url
    assert_response :success
  end

  test "should get house" do
    get stats_house_url
    assert_response :success
  end

  test "should get by_age" do
    get stats_by_age_url
    assert_response :success
  end

end
