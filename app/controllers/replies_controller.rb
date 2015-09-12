class RepliesController < ApplicationController
  def new
    @activity = Activity.find(params[:activity_id])
    @review = Review.find(params[:review_id])
    @reply = Reply.new
  end

  def create
    @reply = Reply.new(reply_params)
    @review = Review.find(params[:review_id])
    @reply.review = @review
    @reply.user = current_user
    if @reply.save
      redirect_to activity_path(params[:activity_id])
    else
      render :new
    end
  end

  def edit
    @reply = Reply.find(params[:id])
  end

  def update
    @reply = Reply.find(params[:id])

    if @reply.update(reply_params)
      redirect_to activity_path(@reply.review.activity)
    else
      render :edit
    end
  end

  private
  def reply_params
    params.require(:reply).permit(:body)
  end
end
