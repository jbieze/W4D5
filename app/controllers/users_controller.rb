class UsersController < ApplicationController
  before_action :require_user!

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_url
    else
      flash.now[:errors] = @user.error.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
