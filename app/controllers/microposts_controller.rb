class MicropostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
	before_action :correct_user,   only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
			@feed_items = [] #as feed_items are not defined for empty micropost array, the is the way to preven from doing .count of nothing
      render 'static_pages/home'
    end
  end

  def destroy
		@micropost.destroy
    redirect_to root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end
		
		def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id]) #In this case, we use find_by instead of find because the latter raises an exception when the micropost doesn’t exist instead of returning nil.
      redirect_to root_url if @micropost.nil?
    end
end