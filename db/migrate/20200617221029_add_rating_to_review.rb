class AddRatingToReview < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :movie_rating, :integer
  end
end
