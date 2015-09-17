class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate           # Authentication
  before_action :reset_session_expires  # Session Expire date

  private

  # Login authentication
  def authenticate
    unless signed_in?
      session[:request_url] = request.url

      redirect_to :root and return
    end
  end

  # Extend expire date
  def reset_session_expires
    request.session_options[:expire_after] = 2.weeks
  end

  # Login user
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user

  # Is User logged in?
  def signed_in?
    User.where(id: session[:user_id]).exists?
  end
  helper_method :signed_in?
end
