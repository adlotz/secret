class StaticPagesController < ApplicationController
  def home
  end

  def secret
  	unless logged_in?
  		flash.now[:danger] = "hey login-toi pour y accéder, c'est bien plus poli !"
  		redirect_to login_path
  end
end
