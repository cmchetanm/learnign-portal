class CreateUserAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :user_answers do |t|
      t.references :question
      t.boolean :answer
      t.references :user
      t.timestamps
    end
  end
end
