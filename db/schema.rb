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

ActiveRecord::Schema.define(version: 20170905033646) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "order_id"
    t.integer  "runner_id"
    t.integer  "area_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.decimal  "subtotal",   precision: 8, scale: 2
    t.decimal  "delivery",   precision: 8, scale: 2
    t.decimal  "cost",       precision: 8, scale: 2
    t.decimal  "sales",      precision: 8, scale: 2
    t.decimal  "gst",        precision: 8, scale: 2
    t.decimal  "profit",     precision: 8, scale: 2
    t.date     "c_date"
    t.boolean  "paid"
    t.string   "area"
    t.string   "runner"
    t.decimal  "discount",   precision: 8, scale: 2
  end

  create_table "runners", force: :cascade do |t|
    t.string   "runner_name"
    t.integer  "area_id"
    t.boolean  "status"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "area"
    t.decimal  "balance",     precision: 8, scale: 2
  end

end
