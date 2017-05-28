class UsersController < ApplicationController

  #before_action :authorize
  #before_action :is_admin?, only: [:create, :new, :destroy]

  def index
    @users = User.order(:firstname)
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to '/'
    else
      flash[:notice] = 'failed'
      redirect_back(fallback_location: 'users/new')
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    redirect_to page_main_path
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :admin, :password, :password_confirmation)
  end

  def is_admin?
    redirect_to root_path unless current_user.admin?
  end

end
