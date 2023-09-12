class AddOverallToGourmets < ActiveRecord::Migration[6.1]
  def change
    add_column :gourmets, :overall, :integer
  end
end
