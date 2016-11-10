class UsersController < ApplicationController

  def new
  end
    def create
      @user = User.new(user_params)

      if @user.save
        flash[:notice] = "New user was created!"
        puts "created a user"
        session[:user_id] = @user.id
        @user.authenticate(params[:password])
        redirect_to [:root]
      else
        flash[:notice] = "Please fill all fields"
        render :new
      end
    end
private
def user_params
  params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation)
end

end