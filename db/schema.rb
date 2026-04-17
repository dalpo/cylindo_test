# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_04_16_130613) do
  create_table "cylindo_features", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.integer "cylindo_product_id", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["cylindo_product_id"], name: "index_cylindo_features_on_cylindo_product_id"
  end

  create_table "cylindo_options", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.integer "cylindo_feature_id", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["cylindo_feature_id"], name: "index_cylindo_options_on_cylindo_feature_id"
  end

  create_table "cylindo_products", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.string "customer"
    t.datetime "updated_at", null: false
    t.string "version"
  end

  create_table "fp_item_cylindo_options", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "cylindo_option_id", null: false
    t.integer "fp_item_id", null: false
    t.datetime "updated_at", null: false
    t.index ["cylindo_option_id"], name: "index_fp_item_cylindo_options_on_cylindo_option_id"
    t.index ["fp_item_id"], name: "index_fp_item_cylindo_options_on_fp_item_id"
  end

  create_table "fp_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "cylindo_product_id", null: false
    t.string "description"
    t.string "name"
    t.integer "parent_id"
    t.datetime "updated_at", null: false
    t.index ["cylindo_product_id"], name: "index_fp_items_on_cylindo_product_id"
  end

  add_foreign_key "cylindo_features", "cylindo_products"
  add_foreign_key "cylindo_options", "cylindo_features"
  add_foreign_key "fp_item_cylindo_options", "cylindo_options"
  add_foreign_key "fp_item_cylindo_options", "fp_items"
  add_foreign_key "fp_items", "cylindo_products"
end
