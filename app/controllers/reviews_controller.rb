class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find params[:restaurant_id]
    @review = Review.new
  end

  def build_review(attributes = {}, user)
    review = reviews.build(attributes)
    review.user = user
    review
  end

  def create
    @restaurant = Restaurant.find params[:restaurant_id]
    @review = @restaurant.build_review review_params, current_user

    if @review.save
      redirect_to restaurants_path
    else
      if @review.errors[:user]
        redirect_to restaurats_path, alert: 'You have already reviewed this restaurant'
      else
        render :new
      end
    end
  end

  private
  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end
end
