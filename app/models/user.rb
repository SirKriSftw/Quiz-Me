class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :created_tests, inverse_of: "creator", class_name: "Test"
  
end
