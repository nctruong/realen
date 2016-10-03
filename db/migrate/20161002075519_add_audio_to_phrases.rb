class AddAudioToPhrases < ActiveRecord::Migration[5.0]
  def change
    add_column :phrases, :audio, :string
  end
end
