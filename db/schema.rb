# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101229184339) do

  create_table "periods", :force => true do |t|
    t.datetime "starting"
    t.datetime "ending"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "punches", :force => true do |t|
    t.integer  "user_id"
    t.integer  "period_id"
    t.datetime "ptime"
    t.string   "note",       :limit => 60
    t.string   "ptype",      :limit => 1
    t.string   "ip",         :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "fname",      :limit => 20
    t.string   "lname",      :limit => 20
    t.boolean  "clocked_in",               :default => false
    t.boolean  "employed",                 :default => false
    t.boolean  "admin",                    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
