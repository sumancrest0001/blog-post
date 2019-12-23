require 'test_helper'

class CreateCatagoriesTest <ActionDispatch::IntegrationTest
  test "get new catagory form and create catagory" do
    get new_catagory_path
    assert_template 'catagories/new'
    assert_difference 'Catagory.count', 1 do
      post catagories_path, params: {catagory:{name: "sports"}}
    end
    assert_template 'catagories/index'
    assert_match "sports", response.body
  end
end
