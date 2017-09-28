class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :birth_year

      t.timestamps
    end

    add_index :characters, :birth_year
  end
end
