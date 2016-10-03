class AddAudioToSentences < ActiveRecord::Migration[5.0]
  def change
    add_column :sentences, :audio, :string
  end
end
