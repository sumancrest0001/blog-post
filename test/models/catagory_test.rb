require 'test_helper'

class CatagoryTest < ActiveSupport::TestCase
  def setup
    @catagory = Catagory.new(name: "sports")
  end
  test "catagory should be valid" do
    assert @catagory.valid?
  end

  test "name should be present" do
    @catagory.name = " "
    assert_not @catagory.valid?
  end

  test "name should be unique" do
    @catagory.save
    catagory2 = Catagory.new(name: "sports")
    assert_not catagory2.valid?
  end

  test "name should not be too long" do
    @catagory.name = "a"*20
    assert_not @catagory.valid?
  end

  test "name should not be too short" do
    @catagory.name = "a"*2
    assert_not @catagory.valid?
  end
end
