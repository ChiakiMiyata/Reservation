class RoomsController < ApplicationController
  def index
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    @room.save
    redirect_to room_path(@room)
  end

  def edit
  end

  private 
  def room_params
    params.require(:room).permit(:room_name, :introduction, :fee, :ddress, :room_image)
  end

end
