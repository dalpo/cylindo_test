class CreateCylindoOptions < ActiveRecord::Migration[8.1]
  def change
    create_table :cylindo_options do |t|
      t.string :code
      t.string :name
      t.references :cylindo_feature, null: false, foreign_key: true

      t.timestamps
    end
  end
end
