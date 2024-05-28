class TestSaving < ApplicationRecord
    belongs_to :test_saver, class_name: "User"
    belongs_to :saved_test, class_name: "Test"
end
