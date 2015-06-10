class SessionsController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:callback]

  def callback
    session[:auth_info] = request.env["omniauth.auth"]
    redirect_to root_url
  end

end
