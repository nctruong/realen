class CreateSentences < ActiveRecord::Migration[5.0]
  def change
    create_table :sentences do |t|
      t.belongs_to :section
      t.string :content
      t.string :comment

      t.timestamps
    end
  end
end
