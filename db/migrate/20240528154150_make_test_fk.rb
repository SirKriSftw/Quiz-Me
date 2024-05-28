class MakeTestFk < ActiveRecord::Migration[7.1]
  def change
    add_column :questions, :test_id, :integer
    add_foreign_key "questions", "tests", column: "test_id"
  end
end
