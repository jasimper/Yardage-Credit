class YarnsController < ApplicationController
  before_filter :authorize

  def index
    respond_to do |format|
      if current_user
        format.html { @yarns = current_user.yarns }
        format.json { render json: current_user.yarns }
      else
        format.html { redirect_to '/login' }
        format.json { render json: @yarn.errors, status: 422 }
      end
    end
  end

  def new
    @yarn = Yarn.new
  end

  def create
    @yarn = current_user.yarns.new(yarn_params)
    respond_to do |format|
      if @yarn.save
        total_all
        format.html { redirect_to yarns_path }
        format.json { render json: {}, status: 201 }
      else
        format.html { render :new }
        format.json { render json: @yarn.errors, status: 422 }
      end
    end
  end

  def show
    @yarn = get_yarn
    respond_to do |format|
      format.html
      format.json { render json: @yarn }
    end
  end

  def edit
    @yarn = get_yarn
  end

  def update
    @yarn = get_yarn
    respond_to do |format|
      if @yarn.update_attributes(yarn_params)
        total_all
        format.html { redirect_to yarns_path }
        format.json { render json: {}, status: 201 }
      else
        format.html { render :edit }
        format.json { render json: @yarn.errors, status: 422 }
      end
    end
  end

  def destroy
    @yarn = get_yarn
    @yarn.destroy
    total_all
    respond_to do |format|
      format.html { redirect_to yarns_path  }
      format.json { render json: {}, status: 200 }
    end
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
