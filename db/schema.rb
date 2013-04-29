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

ActiveRecord::Schema.define(version: 20130429222203) do

  create_table "attendees", force: true do |t|
    t.integer  "number"
    t.string   "ticket"
    t.string   "ticket_name"
    t.string   "ticket_email"
    t.string   "event"
    t.string   "void_status"
    t.integer  "price"
    t.string   "ticket_reference"
    t.string   "tags"
    t.string   "unique_ticket_url"
    t.string   "unique_order_url"
    t.string   "order_reference"
    t.string   "order_name"
    t.string   "order_email"
    t.string   "order_ip"
    t.datetime "order_date"
    t.boolean  "attended",          default: false
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
