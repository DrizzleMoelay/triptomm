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

  def show
    @trip = Trip.find(params[:id])
    @comment = Comment.new
    @comments = @trip.comments.includes(:user)
  end

  def edit
    @trip = Trip.find(params[:id])
    if @trip.user_id != current_user.id
      redirect_to root_path
    end
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update_attributes(trip_params)
     if @trip.save
      redirect_to trip_path 
    else
      @trip.attributes = (trip_params)
      render :edit
    end
  end

  def destroy
    trip = Trip.find(params[:id])
    trip.destroy
    redirect_to root_path
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :concept, :image).merge(user_id: current_user.id)
  end

end
