class CreatePhrases < ActiveRecord::Migration[5.0]
  def change
    create_table :phrases do |t|
      t.belongs_to :sentence
      t.string :content
      t.string :comment

      t.timestamps
    end
  end
end
