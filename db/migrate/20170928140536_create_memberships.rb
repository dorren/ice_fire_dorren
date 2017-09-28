class CreateMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :memberships do |t|
      t.integer :character_id
      t.integer :house_id

      t.timestamps
    end
  end
end
