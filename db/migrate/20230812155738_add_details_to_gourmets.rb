class AddDetailsToGourmets < ActiveRecord::Migration[6.1]
  def change
    add_column :gourmets, :lat, :float
    add_column :gourmets, :lng, :float
  end
end
