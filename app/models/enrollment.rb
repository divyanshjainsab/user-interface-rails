class Enrollment < ApplicationRecord
    # associatations
    belongs_to :user
    belongs_to :course

    # validations
    validates :status, acceptance: { accept: %w[active completed dropout] }
end
