class SessionsController < ApplicationController

  def new
  end

  def create
    @user = login(params[:email], params[:password], remember_me = false)
    if @user
      redirect_to root_url, notice: 'Logged in!'
    else
      render 'new', notice: 'Invalid Login Details'
    end
  end

  def destroy
    logout
    redirect_to root_url, notice: 'Logged out!'
  end

end