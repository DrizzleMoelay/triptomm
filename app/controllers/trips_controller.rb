class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to root_path 
    else
      render :new
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :concept, :image).merge(user_id: current_user.id)
  end

end
