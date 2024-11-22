class BookingsController < ApplicationController
  def index
    @user = current_user
    @bookings = Booking.where(user: @user)
  end

  def new
    @booking = Booking.new
    @flat = Flat.find(params[:flat_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @flat = Flat.find(params[:flat_id])
    @booking.flat = @flat
    @booking.user = current_user
    if @booking.save
      redirect_to flat_path(@flat)
      flash[:notice]= "Booking confirmed"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
