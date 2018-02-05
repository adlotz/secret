class UsersController < ApplicationController


	def index
    @users = User.all
  	end

  	def new
    @user = User.new
  	end

  	def create
    @user = User.new(user_params)
    	if @user.save
        log_in @user
    		flash[:success] = "Bienvenue sur ce site!"
     		redirect_to @user
    	else
    		flash.now[:danger] = "Mauvaise manipulation!"
      		render 'new'
    	end
  	end

  	def show
      @user = User.find(params[:id])
  	end

  	def edit
    	@user = User.find(params[:id])
  	end

    def update
    @user = User.find(params[:id])
      if @user == @current_user
      new_user = user_params
        if @user.update(new_user)
        redirect_to users_path
        else
        render 'edit'
        end
      else
      flash.now[:danger] = "Tu n'as pas les droits pour faire ceci!"
      render 'edit'
      end
    end

  	def destroy
    @user = User.find(params[:id])
      if @user == @current_user
      @user.destroy
    	redirect_to users_path
      else
      flash.now[:danger] = "Tu n'as pas les droits pour faire ceci!"
      render 'edit'
      end
  	end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end


end

