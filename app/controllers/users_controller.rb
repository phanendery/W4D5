class UsersController < ApplicationController

  def new   
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      # login_user!(user)
      redirect_to user_url(user)
    else
      #create flash errors
      render :new
      # redirect_to new_user_url
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
   
end
