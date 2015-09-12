require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    user = users(:one)
  end

  test "POST create with valid input and redirects" do
    assert_difference('User.count', 1) do
      post :create, user: {username: 'user', email: "email@idk.com", password: "password", password_confirmation: "password"}
    end
    assert_redirected_to root_path
  end

  test "POST does NOT create with invalid input and redirects" do
    assert_no_difference('User.count') do
      post :create, user: {username: '', email: "email@idk.com", password: "password", password_confirmation: "password"}
    end
    assert_redirected_to '/signup'
  end

end
