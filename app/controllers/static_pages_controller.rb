class StaticPagesController < ApplicationController
  def home
  end

  def secret
  	
  	unless logged_in?
  		flash[:danger] = 'You must be connected to know about the secret !'
  		redirect_to login_path
	end

  end
end
