class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :created_tests, inverse_of: "creator", class_name: "Test"
  has_many :test_savings, foreign_key: :test_saver_id
  has_many :saved_tests, through: :test_savings
end
