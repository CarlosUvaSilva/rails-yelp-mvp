class ReviewsController < ApplicationController
  def new

    # we need @restaurant in our `simple_form_for`

    @restaurant = Restaurant.find(params[:restaurant_id])

    @review = Review.new
  end

  def create

    @review = Review.new(review_params)

    # we need `restaurant_id` to asssociate review with corresponding restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
    # redirect_to restaurant_path(restaurant_id: @restaurant.id)
    # byebug
    redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_path(@review.restaurant), notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

  def review_params

    params.require(:review).permit(:content, :rating)
  end
end
