class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]	# check whether this user is signed in
	before_action :correct_user,   only: [:edit, :update]	# check whether this user is the user edited or updated
	before_action :admin_user,     only: :destroy
	
	def index
    @users = User.paginate(page: params[:page])
  end
	
	def show
		# this defines variables we want to use in the view
		@user = User.find(params[:id])
		@microposts = @user.microposts.paginate(page: params[:page])
	end
	
	def new
		@user = User.new
  end
	
	def create
    @user = User.new(user_params)
    if @user.save
			sign_in @user	
			flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
	
	def edit
    @user = User.find(params[:id])
  end
	
	def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
	
	def destroy
    @user = User.find(params[:id])
		if current_user?(@user)
			flash[:success] = "Cannot delete yourself."
		else
			@user.destroy
			flash[:success] = "User deleted."
    end
	
    redirect_to users_url
  end
	
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
		
		# Before filters
		
		def correct_user
      @user = User.find(params[:id])	# this sets the controller user variable to the user => not '@user = ' is needed any more
      redirect_to(root_url) unless current_user?(@user)
    end
		
		def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
