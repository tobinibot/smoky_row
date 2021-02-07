require "test_helper"

class DonorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get donor_index_url
    assert_response :success
  end
end
