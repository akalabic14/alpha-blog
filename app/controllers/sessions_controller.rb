class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user
      if user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:default] = "You have succsessfully logged in"
        redirect_to user_path(user)
      else
        flash.now[:danger] = "Incorrect password"
        render 'new'
      end
    else
      flash.now[:danger] = "That email does not exist"
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:succsess] = "You have succsessfully logged out"
    redirect_to root_path
  end
  
end