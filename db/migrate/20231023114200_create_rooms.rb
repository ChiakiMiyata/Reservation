class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.string :room_name
      t.integer :fee
      t.string :address
      t.string :room_image
      t.text :introduction

      t.timestamps
    end
  end
end
