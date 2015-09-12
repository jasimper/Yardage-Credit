require 'test_helper'

class YarnsControllerTest < ActionController::TestCase
 def setup
   @yarn = yarns(:one)
   @user = users(:one)
   @yarn.update_attributes(user_id: @user.id)
 end

 test "GET index" do
   current_user = @user
   get :index
   assert_equal current_user.yarns.count, 1
 end

 test "GET new" do
    get :new
    assert_instance_of Yarn, assigns(:yarn)
    assert_response :success
  end

 # test "POST create yarn with valid attributes" do
 #   current_user = @user
 #   assert_difference('Yarn.count', 1) do
 #     post :create, yarn: { user_id: 1, plied_yardage: 2000, num_of_plies: 2 }
 #   end
 #   assert_redirected_to yarn_path
 # end
 #

end
