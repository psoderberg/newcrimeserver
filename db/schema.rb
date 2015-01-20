# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150120043622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crimes", force: :cascade do |t|
    t.integer  "crime_id"
    t.string   "case_number"
    t.integer  "year"
    t.string   "date"
    t.time     "time"
    t.string   "block"
    t.integer  "iucr"
    t.string   "primary_type"
    t.string   "description"
    t.string   "location_description"
    t.string   "arrest"
    t.string   "domestic"
    t.integer  "beat"
    t.integer  "district"
    t.integer  "ward"
    t.integer  "community_area"
    t.integer  "fbi_code"
    t.integer  "x_coordinate"
    t.integer  "y_coordinate"
    t.date     "updated_on"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "location"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "misdemeanors", force: :cascade do |t|
    t.integer  "crime_id"
    t.string   "case_number"
    t.datetime "date"
    t.string   "block"
    t.integer  "iucr"
    t.string   "primary_type"
    t.string   "description"
    t.string   "location_description"
    t.string   "arrest"
    t.string   "domestic"
    t.integer  "beat"
    t.integer  "district"
    t.integer  "ward"
    t.integer  "community_area"
    t.integer  "fbi_code"
    t.integer  "x_coordinate"
    t.integer  "y_coordinate"
    t.date     "updated_on"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "location"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "small_crimes", force: :cascade do |t|
    t.integer  "crime_id"
    t.string   "case_number"
    t.integer  "year"
    t.date     "date"
    t.time     "time"
    t.string   "block"
    t.integer  "iucr"
    t.string   "primary_type"
    t.string   "description"
    t.string   "location_description"
    t.string   "arrest"
    t.string   "domestic"
    t.integer  "beat"
    t.integer  "district"
    t.integer  "ward"
    t.integer  "community_area"
    t.integer  "fbi_code"
    t.integer  "x_coordinate"
    t.integer  "y_coordinate"
    t.date     "updated_on"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "location"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "tiny_crimes", force: :cascade do |t|
    t.integer  "crime_id"
    t.string   "case_number"
    t.datetime "date"
    t.string   "block"
    t.integer  "iucr"
    t.string   "primary_type"
    t.string   "description"
    t.string   "location_description"
    t.string   "arrest"
    t.string   "domestic"
    t.integer  "beat"
    t.integer  "district"
    t.integer  "ward"
    t.integer  "community_area"
    t.integer  "fbi_code"
    t.integer  "x_coordinate"
    t.integer  "y_coordinate"
    t.date     "updated_on"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "location"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "weathers", force: :cascade do |t|
    t.string   "date"
    t.integer  "max_temperature_f"
    t.integer  "mean_temperature_f"
    t.integer  "min_temperature_f"
    t.integer  "precipitation_in"
    t.string   "events"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

end
