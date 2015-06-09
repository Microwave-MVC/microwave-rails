class SessionsController < ApplicationController

  def callback
    session[:auth_info] = request.env["omniauth.auth"]
    redirect_to root_url
  end

  def new

  end

  def create

  end

  def destroy

  end

end
