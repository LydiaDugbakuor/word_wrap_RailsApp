require 'test_helper'

class WrappersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get wrappers_show_url
    assert_response :success
  end

end
