class ReviewsController < ApplicationController
  def new
    @activity = Activity.find(params[:activity_id])
    @review = Review.new
  end

  def create
    @activity = Activity.find(params[:activity_id])
    @review = Review.new(review_params)
    @review.activity = @activity
    @review.rating = params[:rating].to_i
    @review.user = current_user
    if @review.save
      redirect_to activity_path(@review.activity_id)
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to activity_path(@review.activity_id)
    else
      render :edit
    end
  end

  private
  def review_params
    params.require(:review).permit(:body, :rating)
  end

end
