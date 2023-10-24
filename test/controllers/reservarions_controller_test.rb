require "test_helper"

class ReservarionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reservarions_index_url
    assert_response :success
  end

  test "should get show" do
    get reservarions_show_url
    assert_response :success
  end

  test "should get new" do
    get reservarions_new_url
    assert_response :success
  end
end
