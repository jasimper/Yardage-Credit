class YarnsController < ApplicationController
  before_filter :authorize

  def index
    if current_user
      @yarns = current_user.yarns
    else
      redirect_to '/login'
    end
  end

  def new
    @yarn = Yarn.new
  end

  def create
    @yarn = current_user.yarns.new(yarn_params)
    if @yarn.save
      total_all
      # @total_yardage = (Yarn.where(user_id: @yarn.user_id).sum(:yardage_credit))
      # User.find_by(id: @yarn.user_id).update_attributes(total_yardage: @total_yardage)
      redirect_to yarns_path
    else
      render :new
    end
  end

  def show
    @yarn = get_yarn
  end

  def edit
    @yarn = get_yarn
  end

  def update
    @yarn = get_yarn
    if @yarn.update_attributes(yarn_params)
      total_all
      redirect_to yarns_path
    else
      render :edit
    end
  end

  def destroy
    @yarn = get_yarn
    @yarn.destroy
    total_all
    redirect_to yarns_path
  end

  private

  def yarn_params
    params.require(:yarn).permit(:user_id, :name, :plied_yardage, :num_of_plies, :yardage_credit)
  end

  def get_yarn
    current_user.yarns.find(params[:id])
  end

  def total_all
    @total_yardage = (Yarn.where(user_id: @yarn.user_id).sum(:yardage_credit))
    User.find_by(id: @yarn.user_id).update_attributes(total_yardage: @total_yardage)
  end

end
