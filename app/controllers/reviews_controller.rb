class ReviewsController < ApplicationController
  before_action :find_restaurant
  def new
    @review = Review.new
  end

  def create

    @review = Review.new(review_params)

    @review.restaurant_id = @restaurant.id

    @review.save

    redirect_to restaurant_path(@restaurant)

  end

  private

  def review_params
    params.require(:review).permit(:content)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
