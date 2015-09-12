class ActivitiesController < ApplicationController
  def show
    @activity = Activity.find(params[:id])
    @reviews = @activity.reviews
  end

  def sort
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to activity_path(@activity)
    else
      render :new
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update(activity_params)
      redirect_to activity_path
    else
      render :edit
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to root_path
  end

  private

  def activity_params
    params.require(:activity).permit(:tags, :name, :address, :city, :state, :zip_code, :description, :phone_number, :photo, :rating)
  end
end
