require 'test_helper'

class CatagoriesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @catagory = Catagory.new(name: "sports")
  end
  test "should get catagories index" do
    get catagories_url
    assert_response :success
  end

  test "should get catagories new" do
    get new_catagory_url
    assert_response :success
  end

  test "should get show" do
    get catagory_path(@catagory)
    assert_response :success
  end
end
