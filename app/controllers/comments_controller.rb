class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to trip_path(@comment.trip)
    else
      @trip = @comment.trip
      @comments = @trip.comments
      render "trip/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id,trip_id: params[:trip_id] )
  end

end
