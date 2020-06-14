class User < ApplicationRecord
    has_many :reviews
    has_many :movies, through: :reviews
    
    # username must not be nil
    validates :username, presence: true
    # username cannot already exist
    validates :username, uniqueness: { case_sensitive: false } 
    #first_name must not be nil
    validates :first_name, presence: true
    #last_name must not be nil
    validates :last_name, presence: true
    # email must not be nil
    validates :email, presence: true
    # email must be in an email format
    validates_format_of :email, :with => /\A[^@,\s]+@[^@,\s]+\.[^@,\s]+\z/
    # email must be unique
    validates :email, uniqueness: { case_sensitive: false }
    # password must not be nil
    validates :password, presence: true


    def full_name
        self.first_name + " " + self.last_name
    end

end
