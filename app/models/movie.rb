class Movie < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    has_one_attached :image

    # title must not be nil
    validates :title, presence: true

    # description must not be nil
    validates :description, presence: true

    end
