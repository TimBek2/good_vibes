class SessionsController < ApplicationController

	def new
		user = User.new
	end

	def create
		user = User.find_by email: params[:email]
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to user_path(user)
		else
			flash.now[:alert] = 'Something went wrong!'
			render :new
		end
	end

	def destroy
		reset_session
		redirect_to root_url
	end

end