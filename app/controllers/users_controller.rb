class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
  if @user["email"] = User.find_by({"email" => params["email"]})
    flash["notice"] = "Email already exist"
    redirect_to "/sessions"
  else
    @user["first_name"] = params["user"]["first_name"]
    @user["last_name"] = params["user"]["last_name"]
    @user["email"] = params["user"]["email"]
    @user["password"] = BCrypt::Password.create(params["user"]["password"])
    @user.save
    redirect_to "/posts"
  end 
  end

end
