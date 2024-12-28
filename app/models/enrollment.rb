class Enrollment < ApplicationRecord
    # associatations
    belongs_to :user
    belongs_to :course

    # validations
    validates :status, acceptance: { accept: %w[enrolled completed dropout] }

end
