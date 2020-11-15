class UsersChannel < ApplicationCable::Channel
  def subscribed
    current_user.update online: true
    @users = User.where online: true

    stream_from("users_channel")

    broadcast_users
  end

  def unsubscribed
    current_user.update online: false
    @users = User.where online: true

    broadcast_users
  end

  private

  def broadcast_users
    ActionCable.server.broadcast "users_channel", users_online: @users.map(&:nickname).join(', ')
  end
end
