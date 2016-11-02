# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161102145520) do

  create_table "biomass_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "owner_id"
  end

  create_table "biomasses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "owner_id"
  end

  create_table "feedstocks", force: :cascade do |t|
    t.integer  "biomass_type_id"
    t.integer  "harvest_id"
    t.float    "amount"
    t.string   "unit"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "owner_id"
    t.index ["biomass_type_id"], name: "index_feedstocks_on_biomass_type_id"
    t.index ["harvest_id"], name: "index_feedstocks_on_harvest_id"
  end

  create_table "harvests", force: :cascade do |t|
    t.integer  "biomass_id"
    t.string   "plot_location"
    t.string   "plot_information"
    t.string   "fertilizer_types"
    t.string   "fertilizer_applications"
    t.string   "soil_information"
    t.string   "weather_information"
    t.string   "storage_location"
    t.date     "planting_date"
    t.date     "harvest_date"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "owner_id"
    t.index ["biomass_id"], name: "index_harvests_on_biomass_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.string   "name"
    t.integer  "inventory_batch_id"
    t.integer  "qty"
    t.integer  "qty_unit"
    t.string   "status"
    t.string   "storage_location"
    t.string   "custodian"
    t.integer  "owner_id"
    t.text     "comments"
    t.string   "created_by"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "inventory_type"
    t.index ["inventory_batch_id"], name: "index_inventories_on_inventory_batch_id"
    t.index ["owner_id"], name: "index_inventories_on_owner_id"
  end

  create_table "inventory_batches", force: :cascade do |t|
    t.string   "name"
    t.string   "container_type"
    t.integer  "supplier_id"
    t.string   "lot_no"
    t.text     "comments"
    t.string   "created_by"
    t.integer  "source_batch_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "material_id"
    t.index ["material_id"], name: "index_inventory_batches_on_material_id"
    t.index ["supplier_id"], name: "index_inventory_batches_on_supplier_id"
  end

  create_table "inventory_hydrolysates", force: :cascade do |t|
    t.string   "barcode"
    t.integer  "custom_batch_no"
    t.decimal  "batch_volume",       precision: 8, scale: 2
    t.decimal  "glucan_desired",     precision: 8, scale: 2
    t.decimal  "glucan_theoretical", precision: 8, scale: 2
    t.decimal  "biomass_moisture",   precision: 8, scale: 2
    t.decimal  "source_weight",      precision: 8, scale: 2
    t.decimal  "batch_weight",       precision: 8, scale: 2
    t.text     "comments"
    t.string   "created_by"
    t.integer  "inventory_batch_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.index ["inventory_batch_id"], name: "index_inventory_hydrolysates_on_inventory_batch_id"
  end

  create_table "inventory_pretreated_feedstocks", force: :cascade do |t|
    t.string   "GLBRC_barcode"
    t.string   "pretreat_method"
    t.string   "grand_size"
    t.string   "operator"
    t.integer  "notebook_reference"
    t.decimal  "stirring_RPM",       precision: 8, scale: 2
    t.decimal  "temperature",        precision: 8, scale: 2
    t.decimal  "NH3_loading",        precision: 8, scale: 2
    t.decimal  "overpressure",       precision: 8, scale: 2
    t.decimal  "residence_time",     precision: 8, scale: 2
    t.string   "weight"
    t.decimal  "water_loading",      precision: 8, scale: 2
    t.text     "comments"
    t.integer  "created_by"
    t.integer  "inventory_batch_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.index ["inventory_batch_id"], name: "index_inventory_pretreated_feedstocks_on_inventory_batch_id"
  end

  create_table "inventory_untreated_feedstocks", force: :cascade do |t|
    t.string   "plant_year"
    t.date     "plant_date"
    t.date     "harvest_date"
    t.string   "plant_location"
    t.string   "plant_field"
    t.string   "grand_size"
    t.text     "comments"
    t.string   "created_by"
    t.integer  "inventory_batch_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["inventory_batch_id"], name: "index_inventory_untreated_feedstocks_on_inventory_batch_id"
  end

  create_table "material_types", force: :cascade do |t|
    t.string   "mattype_code"
    t.string   "mat_category"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "materials", force: :cascade do |t|
    t.string   "name"
    t.string   "mattype_code"
    t.string   "default_unit_code"
    t.string   "parent_matcode"
    t.decimal  "min_level",         precision: 8, scale: 2
    t.decimal  "low_level",         precision: 8, scale: 2
    t.string   "created_by"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "zip"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "fax"
    t.string   "contact"
    t.string   "email"
    t.string   "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "role",                   default: "User"
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",                     null: false
    t.integer  "item_id",                       null: false
    t.string   "event",                         null: false
    t.string   "whodunnit"
    t.text     "object",     limit: 1073741823
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

end
