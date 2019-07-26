class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.references :chapter
      t.integer :level
      t.timestamps
    end
  end
end
