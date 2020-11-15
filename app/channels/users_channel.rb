class UsersChannel < ApplicationCable::Channel
  def subscribed
    current_user.update online: true
    logger.info "STATUS. Set user #{current_user.nickname} status to online"

    stream_from("users_channel")

    broadcast_users
  end

  def unsubscribed
    current_user.update online: false
    logger.info "STATUS. Set user #{current_user.nickname} status to offline"

    broadcast_users
  end

  private

  def users_online
    User.online.map(&:nickname).join(', ')
  end

  def broadcast_users
    ActionCable.server.broadcast "users_channel", users_online: users_online
  end
end
