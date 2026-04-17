class CreateFpItems < ActiveRecord::Migration[8.1]
  def change
    create_table :fp_items do |t|
      t.string :name
      t.string :description
      t.integer :parent_id
      t.references :cylindo_product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
