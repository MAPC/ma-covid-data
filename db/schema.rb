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

ActiveRecord::Schema.define(version: 2021_01_13_220026) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "case_counts", force: :cascade do |t|
    t.string "municipality"
    t.string "county"
    t.integer "population"
    t.integer "total_case_counts"
    t.integer "two_week_case_counts"
    t.decimal "average_daily_rate"
    t.string "change_in_last_week"
    t.integer "total_tests"
    t.integer "total_tests_last_two_weeks"
    t.integer "total_positive_tests"
    t.decimal "percent_positivity"
    t.string "change_since_last_week"
    t.decimal "testing_rate"
    t.date "report"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
