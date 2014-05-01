class SessionsController < ApplicationController

	def new
		# sign up form
		# no need for any variables because we're not adding anything
		# to the database
	end

	def create
		# instructions
		# lets get the isername and password from the form
		# lets see if there's a user with that username
		# if there is AND the password matches, then log in
		# if not, don't log in and show an error

		@username = params[:session][:username]
		@password = params[:session][:password]

		@user = User.find_by_username(@username)

		if @user.present? and @user.authenticate(@password)
			# to log in give them a session
			session[:user_id] = @user.id
			flash[:sucess] = "Welcome back, #{@user.name}"
			redirect_to root_path
		else
			# for security
			flash[:error] = "Log in failed"
			render "new"
		end
	end

	def destroy
		# log out
		reset_session
		flash[:success] = "You are now logged out"
		redirect_to root_path
	end
end
