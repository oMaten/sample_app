class UsersController < ApplicationController
  def new
  	@user = User.new
  end
  def show
  	@user = User.find(params[:id])
  end
  def create
    flash[:success] = "Welcome to Sample App"
  	@user = User.new(params[:user])
    redirect_to @user
  	if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end
end