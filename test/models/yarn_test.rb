require 'test_helper'

class YarnTest < ActiveSupport::TestCase
  def setup
    @yarn = yarns(:one)
  end

  test "the fixture is valid" do
    assert @yarn.valid?
  end

  test "is invalid without num_of_plies" do
    @yarn.num_of_plies = nil
    refute @yarn.valid?
    assert @yarn.errors.keys.include?(:num_of_plies)
  end

  test "is invalid without plied_yardage" do
    @yarn.plied_yardage = nil
    refute @yarn.valid?
    assert @yarn.errors.keys.include?(:plied_yardage)
  end

  test "belongs to user" do
    @yarn.user = users(:one)
    assert_respond_to @yarn, :user
    assert_instance_of User, @yarn.user
  end

end
