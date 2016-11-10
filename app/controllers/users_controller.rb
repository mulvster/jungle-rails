class UsersController < ApplicationController
	def new
		
	end

	def create
		 @user = User.new(user_params)
    	if @user.save
    	  flash[:notice] = "New User Created"
    	  puts "user created"
	      session[:user_id] = @user.id
	      redirect_to '/'
    	else
    		flash[:notice] = "Please fill all fields"
    		render :new
    	end
	end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
