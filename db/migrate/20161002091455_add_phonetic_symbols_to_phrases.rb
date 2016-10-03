class AddPhoneticSymbolsToPhrases < ActiveRecord::Migration[5.0]
  def change
    add_column :phrases, :phonetic_symbols, :string
  end
end
