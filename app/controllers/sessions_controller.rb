class SessionsController < ApplicationController

def index
  @session = Session.all
end

def new
  @session = Session.new
end


  def create
  #create the user
    username = params[:username]
    password = params[:password]

 #find the user
  @user = User.where(username: username).first

  if @user.nil?
    flash[:alert] = "Not a user"
    redirect_to :back

    #if password and username are correct then a new session will be made
  else
     if @user.password == password
      session[:user_id] = @user.id
      flash[:alert] = "Welcome"
      redirect_to user_path(@user)
    end 
  end
 end


  def destroy
    session[:user_id] = nil
    redirect_to :back
  end
end