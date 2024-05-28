class Test < ApplicationRecord
    belongs_to :creator, class_name: "User", foreign_key: "creator_id"
    has_many :questions
    has_many :test_savings, foreign_key :saved_test_id
    has_many :test_savers, through :test_savings, source: :test_saver
end
