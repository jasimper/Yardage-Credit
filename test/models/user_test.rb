require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
  end

  test "the fixture is valid" do
    assert @user.valid?
  end

  test "is invalid without username" do
    @user.username = nil
    refute @user.valid?
    assert @user.errors.keys.include?(:username)
  end

  test "is invalid without email" do
    @user.email = nil
    refute @user.valid?
    assert @user.errors.keys.include?(:email)
  end

  test "has many yarns" do
    assert_respond_to @user, :yarns
    assert_instance_of Yarn, @user.yarns.new
  end
end
