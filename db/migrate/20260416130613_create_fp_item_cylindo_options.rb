class CreateFpItemCylindoOptions < ActiveRecord::Migration[8.1]
  def change
    create_table :fp_item_cylindo_options do |t|
      t.references :fp_item, null: false, foreign_key: true
      t.references :cylindo_option, null: false, foreign_key: true

      t.timestamps
    end
  end
end
