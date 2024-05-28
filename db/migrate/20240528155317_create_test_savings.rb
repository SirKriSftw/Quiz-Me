class CreateTestSavings < ActiveRecord::Migration[7.1]
  def change
    create_table :test_savings do |t|
      t.integer "test_saver_id", null: false
      t.integer "saved_test_id", null: false
      t.timestamps
    end

    add_foreign_key "test_savings", "tests", column: "saved_test_id"
    add_foreign_key "test_savings", "users", column: "test_saver_id"
  end
end
