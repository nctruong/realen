class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
      t.belongs_to :lession

      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
