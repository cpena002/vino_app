class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :name
      t.integer :vintage
      t.text :description
      t.references :winery, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
