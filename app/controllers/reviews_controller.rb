class ReviewsController < ApplicationController
  def show
    @reviews = Review.find params[:id]
  end
  def create
    Review.create(
      description: review_params[:description],
      rating: review_params[:rating],
      product_id: params[:product_id],
      user_id: current_user.id
    )
    
    redirect_to product_path(params[:product_id])
  end

  def destroy

    @review = Review.find params[:id]
    @review.destroy
    redirect_to [@review.product], notice: 'Product deleted!'
  
  end	
  private
  def review_params
    params.require(:review).permit(:description, :review, :product_id, :rating, :authenticity_token)
  end
end
