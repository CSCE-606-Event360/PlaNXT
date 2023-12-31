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

ActiveRecord::Schema[7.0].define(version: 2023_04_05_014828) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_steps", force: :cascade do |t|
    t.string "Num"
    t.bigint "plan_model_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "StartDay"
    t.time "StartTime"
    t.time "EndTime"
    t.time "Break1start"
    t.time "Break1end"
    t.time "Break2start"
    t.time "Break2end"
    t.index ["plan_model_id"], name: "index_event_steps_on_plan_model_id"
  end

  create_table "plan_models", force: :cascade do |t|
    t.string "name"
    t.text "data"
    t.integer "creator"
    t.string "editPermission"
    t.string "viewPermission"
    t.string "extra1"
    t.string "extra2"
    t.string "extra3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "viewers", default: [], array: true
    t.integer "editors", default: [], array: true
    t.boolean "public", default: false
    t.index ["creator"], name: "index_plan_models_on_creator"
  end

  create_table "users", force: :cascade do |t|
    t.integer "level"
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.string "viewPermission"
    t.string "editPermission"
    t.text "description"
    t.string "extra1"
    t.string "extra2"
    t.string "extra3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "enabled", default: true
    t.index ["email"], name: "index_users_on_email"
  end

  add_foreign_key "event_steps", "plan_models"
end
