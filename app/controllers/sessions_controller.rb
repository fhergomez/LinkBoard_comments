  class SessionsController < ApplicationController

  def new
    # render plain: "new session"
  end

    #login action (create a session)
  def create
    # render json: params #testing line to make sure data is going through
    # render plain: "create session"
    user = User.authenticate(params[:user][:email],
     params[:user][:password])#from json data params is the curly brace user, email and password are the keys in the json file
      if user
        #correct email / password
        session[:user_id] = user.id
        flash[:success] = 'You are now logged in.'#:success can be any value
        redirect_to root_path
      else
        #wrong email or password
        flash[:danger] = 'Invalid email or password'
        #render :new
        redirect_to login_path
      end
  end

  #logout action (invalidates thw session)
  def destroy
    # render plain: "destroy session"
    session[:user_id] = nil
    flash[:info] = "You are logged out."
    redirect_to login_path
  end

end