class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :log_in_user!(user)

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    false if current_user.nil?
    true
  end

  def log_in_user!(user)
    sesson[:session_token] = user.reset_session_token!
  end
end
