class RoomsController < ApplicationController
  before_action :set_room, only: [:show]
  before_action :users_online, only: %i[index show create]

  def index
    @rooms = Room.all
    @room = Room.new
  end

  def show
  end

  def create
    @room = Room.create!

    redirect_to @room, notice: 'Room was successfully created.'
  end

  private

  def users_online
    @online_users = User.online.map(&:nickname).join(', ')
  end

  def set_room
    @room = Room.find_by(token: params[:token])
  end
end
