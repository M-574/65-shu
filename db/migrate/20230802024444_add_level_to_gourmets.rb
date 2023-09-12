class AddLevelToGourmets < ActiveRecord::Migration[6.1]
  def change
    add_column :gourmets, :level, :integer
  end
end
