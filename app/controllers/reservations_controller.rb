class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(@reservation.room_id)
    @user = User.find(current_user.id)
    if @reservation.valid?
      day = @reservation.check_out - @reservation.check_in
      @days = day.to_i
      @cost = @room.fee * @reservation.people * @days
    else
      flash[:warning] = "予約内容に誤りがあります"
      render "/rooms/show"
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to "/reservations"
    else
      render "/reservations/confirm"
    end
  end

  def back
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(@reservation.room_id)
    @user = User.find(@reservation.user_id)
    render "/rooms/show"
  end

  private 
  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :people, :user_id, :room_id)
  end
end
