class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    review = Review.create(review_params)
    review.time_posted = Time.now
    byebug

    redirect_to reviews_path
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)

    redirect_to review_path(review)
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy

    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:description, :user_id, :movie_id, :date_posted)
  end

end
