class SessionsController < ApplicationController
  skip_before_action :authenticate

  # Login
  def callback
    auth = request.env["omniauth.auth"]
    authentication = Authentication.find_by(provider: auth["provider"], uid: auth["uid"]) || Authentication.create_with_omniauth(auth)
    authentication.auth_update(auth)

    # User Creation
    user = User.find_by(id: authentication.user_id) || User.create_with_auth(authentication, request)

@usr = user
    session[:user_id] = user.id
    flash[:notice]    = "Your Emblem has created!"

logger.debug "Namae:" + user.name
logger.debug "Gazou:" + user.image
Cloudinary::Uploader.upload(user.image, :public_id => 'e' + user.id.to_s )

    unless session[:request_url].blank?
      redirect_to session[:request_url]
      # redirect_to :action => "showemblem", :id => session[:user_id]
      session[:request_url] = nil
      return
    end

    # redirect_to :root and return
    redirect_to "/showemblem/" + session[:user_id].to_s and return
  end

  # Logout
  def destroy
    session[:user_id] = nil

    redirect_to :root, notice: "Your account was logged off" and return
  end

  # Login error
  def failure
    flash[:alert] = 'Auth Failure'
    redirect_to :root and return
  end
end
