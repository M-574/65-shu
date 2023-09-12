class AddAreaToGourmets < ActiveRecord::Migration[6.1]
  def change
    add_column :gourmets, :area, :string
  end
end
