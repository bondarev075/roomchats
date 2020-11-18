class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :users_online

  private

  def current_user
    @current_user ||= User.where(id: cookies.signed[:user_id]).first

    if @current_user.nil?
      @current_user = User.create
      cookies.signed[:user_id] = current_user.id
    end

    @current_user
  end

  def users_online
    User.online
  end
end
