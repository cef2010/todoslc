class RepliesController < ApplicationController
  def new
    @reply = Reply.new
  end

  def create
    @reply = Reply.new(reply_params)

    if @reply.save
      redirect_to activity_path(@reply.review.activity)
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
end
