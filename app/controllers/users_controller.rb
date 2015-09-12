class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      redirect_to yarns_path
    else
      redirect_to root_path
    end
  end

private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :total_yardage)
  end
end
