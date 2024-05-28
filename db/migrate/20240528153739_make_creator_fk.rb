class MakeCreatorFk < ActiveRecord::Migration[7.1]
  def change
    add_column :tests, :creator_id, :integer
    add_foreign_key "tests", "users", column: "creator_id"
  end
end
