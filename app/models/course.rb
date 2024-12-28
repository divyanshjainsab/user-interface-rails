class Course < ApplicationRecord
    # associations
    has_many :enrollments
    has_many :users, through: :enrollments

    # validations
    validates :name, uniqueness: true
end
