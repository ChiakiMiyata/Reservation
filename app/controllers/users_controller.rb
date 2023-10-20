class UsersController < ApplicationController
  def index
  end

  def show
    @user = current_user
  end

  def profile
    @user = current_user
  end
  
  def edit
    @user = User.find (params[:id])
  end

  def update
    @user = User.find (params[:id])
    if @user.update(params.require(:user).permit(:avatar,:name,:profile))
      redirect_to :users_profile
    else
      render "edit"
    end
  end
end
