module SessionsHelper
	# these methods will not be public, unless 'inlcude SessionHelper' is added to ApplicationController
	def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end
	
	def signed_in?
    !current_user.nil?
  end
	
	def current_user=(user)		#almost like property set
    @current_user = user
  end
	
  def current_user					#almost like property get
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end
	
	def sign_out
		#change token for security purposes
    current_user.update_attribute(:remember_token,
                                  User.encrypt(User.new_remember_token))
    #clear cookies
		cookies.delete(:remember_token)
		#clear current_user
    self.current_user = nil
  end
end
