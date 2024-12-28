class User < ApplicationRecord
    # associations
    has_many :enrollments
    has_many :courses, through: :enrollments 

    # validations
    validates :name, presence: true
end
