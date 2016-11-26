class UsersController < ApplicationController

	def sign_up;end
	def sign_in;end

	def registration
		User.create(user_params)
		redirect_to sign_in_users_path
	end

	def login
		user = User.find_by(user_params)
		if user
			session[:user_id] = user.id
			redirect_to chatrooms_path
		else
			redirect_to :back
		end
	end

	def sign_out
		session[:user_id] = nil
		redirect_to root_path
	end

	private

	def user_params
		params.require(:user).permit(:username)
	end
end