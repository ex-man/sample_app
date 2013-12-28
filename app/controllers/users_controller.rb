class UsersController < ApplicationController
  def new
  end
	
	#def create
	#	@user = User.new(user_params)		#this should allow us to use non-db parameters
	#end
	
	#private
	#	def user_params
	#		params.require(:name, :email).permit(:password, :password_confirmation)
	#	end
end
