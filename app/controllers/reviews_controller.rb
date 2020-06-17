class ReviewsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @errors = flash[:errors]
    @review = Review.new
    @review.user_id = current_user.id
    render :new
  end

  def create
    review = Review.create(review_params)
    review.user_id = current_user.id
    if review.valid?
      review.time_posted = Time.now

      redirect_to reviews_path
    else
      flash[:errors] = review.errors.full_messages
      redirect_to new_review_path(review)
    end

  end

  def edit
    @errors = flash[:errors]
    @review = Review.find(params[:id])
    render :edit
  end

  def update
    review = Review.find(params[:id])
    if review.valid?
      review.update(review_params)

      redirect_to review_path(review)
    else
      flash[:errors] = review.errors.full_messages
      redirect_to edit_review_path(review)
    end
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
