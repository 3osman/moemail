require 'test_helper'

class DirectControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get direct_new_url
    assert_response :success
  end

end
