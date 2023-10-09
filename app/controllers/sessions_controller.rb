class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # if the user exists and the password is correct
    if user && user.authenticate(params[:password])
      # save the user id inside the browser cookie.
      session[:user_id] = user.id
      redirect_to '/'
    else
      # if something goes wrong with logging in
      redirect_to '/login'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/login'
  end

end
