class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
			if @user.save
				flash.notice = 'Thanks for registering!'
				redirect_to user_path(@user)
			else
				flash.now[:alert] = 'Something went wrong!'
				render :new
			end
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy
		@user = User.find(params[:id])
	end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end