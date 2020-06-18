class Movie < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews 
    has_one_attached :image, :dependent => :destroy

    # title must not be nil
    validates :title, presence: true

    # description must not be nil
    validates :description, presence: true

    end
