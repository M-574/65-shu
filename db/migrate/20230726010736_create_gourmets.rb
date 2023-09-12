class CreateGourmets < ActiveRecord::Migration[6.1]
  def change
    create_table :gourmets do |t|
      t.string :prefecture
      t.string :food
      t.string :shop_name
      t.text :about_shop
      t.string :price
      t.string :addres
      t.string :image

      t.timestamps
    end
  end
end
