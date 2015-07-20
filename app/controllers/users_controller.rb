class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :correct_user,   only: [:edit, :update]
  def new
  	@user = User.new
  end
  def show
  	@user = User.find(params[:id])
  end
  def index
    @users = User.order(:id).page(params[:page]).per(15)
  end
  def create
  	@user = User.new(params[:user])
  	if @user.save
      sign_in @user
      flash[:success] = "Welcome to Sample App"
      redirect_to @user
    else
      render 'new'
    end
  end
  def edit
  end
  def update
    if @user.update_attributes(params[:user])
      # Handle a successful update.
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  private
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "Please login first."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      unless current_user?(@user)
        redirect_to(root_path)
      end
    end
end