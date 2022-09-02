class TripsController < ApplicationController
  def index
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :concept, :image).merge(user_id: current_user.id)
  end

end
