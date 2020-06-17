class RemoveMoviesforeignKeyFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :reviews, :movies
    remove_foreign_key :reviews, :users
  end
end
