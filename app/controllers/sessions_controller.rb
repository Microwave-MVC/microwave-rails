class SessionsController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:callback]

  def callback
    session[:auth_info] = request.env["omniauth.auth"]
    puts session[:auth_info]
    redirect_to root_url
  end

  def new

  end

  def create

  end

  def destroy

  end

end
