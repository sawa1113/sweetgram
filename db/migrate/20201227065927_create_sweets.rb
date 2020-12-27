class CreateSweets < ActiveRecord::Migration[5.2]
  def change
    create_table :sweets do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.integer :price
      t.integer :calorie
      t.string :image_id

      t.timestamps
    end
  end
end
