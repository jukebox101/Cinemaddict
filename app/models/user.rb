class User < ApplicationRecord
    has_many :reviews
    has_many :movies, through: :reviews

    def full_name
        self.first_name + " " + self.last_name
    end

end
