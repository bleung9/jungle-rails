class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.user_id = session[:user_id]
    @review.product_id = params[:product_id]
    if @review.save
      byebug
      redirect_to "/products/#{@review.product_id}"
    else
      raise "rating failed to submit!"
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :product_id,
      :user_id,
      :description,
      :rating,
      :created_at,
      :updated_at
    )
  end
end
