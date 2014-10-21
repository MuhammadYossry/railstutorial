class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  def new
  	@user = User.new
  end
  def create
    user = User.new(user_params)
    if user.save
      log_in @ser
      remember user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    def authenticated?(remember_token)
      return false if remember_digest.nil?
      BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
end
