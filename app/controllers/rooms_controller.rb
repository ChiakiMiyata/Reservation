class RoomsController < ApplicationController
  def index
    @rooms = Room.where(user_id: current_user&.id)
  end

  def show
    @reservation = Reservation.new
    @room = Room.find(params[:id])
   #@user = User.find(current_user.id)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      redirect_to room_path(@room)
    else
      render "new"
    end
  end

# def edit
#   @room = Room.find(params[:id])
# end

# def update
#   @room = Room.find(params[:id])
#   @room.update(room_params)
#   redirect_to room_path(@room)
# end

  def search
    @rooms = Room.where('rooms.address LIKE(?)',"%#{params[:area]}%")
    @results = @rooms.count
    if params[:keyword].present?
      @rooms = Room.where([ 'rooms.address LIKE ? OR rooms.introduction LIKE ? OR rooms.room_name LIKE ? ', "%#{params[:keyword]}%","%#{params[:keyword]}%","%#{params[:keyword]}%" ])
      @results = @rooms.count
    end
  end

  def area
    @rooms = Room.where(address: (params[:format]))
    @results = @rooms.count
  end

  private 
  def room_params
    params.require(:room).permit(:room_name, :introduction, :fee, :address, :room_image)
  end

end
