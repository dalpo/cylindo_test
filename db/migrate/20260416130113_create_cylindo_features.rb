class CreateCylindoFeatures < ActiveRecord::Migration[8.1]
  def change
    create_table :cylindo_features do |t|
      t.string :code
      t.string :name
      t.references :cylindo_product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
