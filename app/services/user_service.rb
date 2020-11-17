class UserService
  def initialize(user, online)
    @user = user
    @online = online
  end

  def perform
    update_user_status
    broadcast_user
  end

  private

  def update_user_status
    @online = (ActionCable.server.connections.map(&:current_user).include?(@user) || @online)
    @user.update(online: @online)
  end

  def broadcast_user
    ActionCable.server.broadcast "users_channel", user: @user.as_json
  end
end
