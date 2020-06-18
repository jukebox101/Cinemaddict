class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  # description must not be nil
  # validates :description, presence: true

end
