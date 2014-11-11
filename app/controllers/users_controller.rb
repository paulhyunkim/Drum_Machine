class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:remember_token] = @user.id.to_s
      redirect_to root_path
    else
      render 'new'
    end
  end

  protected

  def user_params
    params.require(:user).permit(:username, :password)
  end
  
end
