class Question < ApplicationRecord
    belongs_to :test
    has_many :choices

    validates :question, :answer, presence: true
end
