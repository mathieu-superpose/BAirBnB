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

ActiveRecord::Schema.define(version: 2020_08_01_153909) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accomodations", force: :cascade do |t|
    t.integer "availlable_beds"
    t.integer "price_per_night"
    t.text "description"
    t.boolean "has_wifi"
    t.text "welcome_text"
    t.bigint "host_id"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_accomodations_on_city_id"
    t.index ["host_id"], name: "index_accomodations_on_host_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.boolean "is_paid"
    t.datetime "start_date"
    t.integer "duration"
    t.bigint "guest_id"
    t.bigint "accomodation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accomodation_id"], name: "index_reservations_on_accomodation_id"
    t.index ["guest_id"], name: "index_reservations_on_guest_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "phone"
    t.text "description"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
