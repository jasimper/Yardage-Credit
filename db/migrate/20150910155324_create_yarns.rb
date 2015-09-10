class CreateYarns < ActiveRecord::Migration
  def change
    create_table :yarns do |t|
      t.integer :plied_yardage
      t.integer :num_of_plies
      t.integer :yardage_credit
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :yarns, :user_id
  end
end
