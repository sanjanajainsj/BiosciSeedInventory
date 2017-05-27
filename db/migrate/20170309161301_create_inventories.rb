class CreateInventories < ActiveRecord::Migration[5.0]
  def change
    create_table :inventories do |t|
      t.integer :gid
      t.string :location
      t.string :room
      t.string :row
      t.string :shelf
      t.string :box
      t.string :stockid
      t.string :source

      t.timestamps
    end
  end
end
