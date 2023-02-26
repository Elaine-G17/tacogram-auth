class SessionsController < ApplicationController
  def new
  end

def create
    @user = User.find_by({"email" => params["email"]})
 if @user 
        if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"]= @user["id"]
        flash["notice"] = "You logged in!"
        redirect_to "/posts"
        else
        flash["notice"] = "Wrong email/password"
        redirect_to "/sessions"
        end
 else
    redirect_to "sessions"
 end
end

def destroy
    session["user_id"] = nil
    redirect_to "/sessions/new"
end
end
