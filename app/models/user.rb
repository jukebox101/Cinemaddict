class User < ApplicationRecord
    has_many :reviews, :likes
    has_many :movies, through: :reviews
end
