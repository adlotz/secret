class StaticPagesController < ApplicationController
  def home
  end

  def secret
  	
  	unless logged_in?
  		flash[:danger] = "Bien essayé petit malin, connecte toi c'est plus poli !"
  		redirect_to login_path
	end

  end
end
