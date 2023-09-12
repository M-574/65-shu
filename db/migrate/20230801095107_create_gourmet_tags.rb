class CreateGourmetTags < ActiveRecord::Migration[6.1]
  def change
    create_table :gourmet_tags do |t|
      t.references :gourmet, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
