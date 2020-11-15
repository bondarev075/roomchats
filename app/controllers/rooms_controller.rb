class RoomsController < ApplicationController
  before_action :set_room, only: [:show]

  def index
    @rooms = Room.all
    @room = Room.new

    @online_users = User.where(online: true).map(&:nickname).join(', ')
  end

  def show
    @online_users = User.where(online: true).map(&:nickname).join(', ')
  end

  def create
    @room = Room.create!

    redirect_to @room, notice: 'Room was successfully created.'
  end

  private

  def set_room
    @room = Room.find_by(token: params[:token])
  end
end
