class ChangeDataTypeForQuestionId < ActiveRecord::Migration[7.1]
  def change
    change_column :choices, :question_id, :integer
  end
end
