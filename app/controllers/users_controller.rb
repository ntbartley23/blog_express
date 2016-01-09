class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  
    def show
   if params[:id]
     @user = User.find(params[:id])
    else
     redirect_to users_path unless current_user.present?
     @user = current_user
   end
 end


  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "User successfully created"
      redirect_to user_path(@user)
     else
      flash[:notice] = "User cannot be create."
       redirect_to :back    
     end
  end

  def edit
  end

  def update
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "user successfully deleted"
    else
      flash[:notice] = "Error occured while deleting. User could Not be deleted."
  
   redirect_to :back
   end
 end 
end

private

def user_params
  params.require(:user).permit(:fname, :lname, :email, :password, :username)
end
