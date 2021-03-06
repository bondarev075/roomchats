class UsersChannel < ApplicationCable::Channel
  def subscribed
    stream_from("users_channel")

    user_service = UserService.new(current_user, true)
    user_service.perform
  end

  def unsubscribed
    user_service = UserService.new(current_user, false)
    user_service.perform
  end
end
