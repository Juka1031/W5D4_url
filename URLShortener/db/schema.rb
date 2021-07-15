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

ActiveRecord::Schema.define(version: 2021_07_15_204758) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "shortened_urls", force: :cascade do |t|
    t.string "long_url", null: false
    t.string "short_url"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["long_url"], name: "index_shortened_urls_on_long_url", unique: true
    t.index ["short_url"], name: "index_shortened_urls_on_short_url"
    t.index ["user_id"], name: "index_shortened_urls_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "visits", force: :cascade do |t|
    t.integer "visitor", null: false
    t.integer "visited_short_urls", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["visited_short_urls"], name: "index_visits_on_visited_short_urls"
    t.index ["visitor"], name: "index_visits_on_visitor"
  end

end
