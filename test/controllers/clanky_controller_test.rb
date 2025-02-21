require "test_helper"

class ClankyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get clanky_index_url
    assert_response :success
  end
end
