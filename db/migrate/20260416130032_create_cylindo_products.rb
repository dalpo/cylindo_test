class CreateCylindoProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :cylindo_products do |t|
      t.string :code
      t.string :version
      t.string :customer

      t.timestamps
    end
  end
end
