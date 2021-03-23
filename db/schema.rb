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

ActiveRecord::Schema.define(version: 2021_03_22_180501) do

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

  create_table "ma_municipal_data_keys", force: :cascade do |t|
    t.integer "muni_id"
    t.string "municipal"
    t.integer "mapc"
    t.integer "mf164"
    t.integer "county_id"
    t.string "county"
    t.integer "comm_type"
    t.string "comm_name"
    t.integer "subtype_id"
    t.string "subtype"
    t.integer "rpa_id"
    t.string "rpa_name"
    t.integer "mpo_id"
    t.string "mpo_name"
    t.integer "region_id"
    t.string "region"
    t.integer "subreg_id"
    t.string "subregion"
    t.integer "cousub_id"
    t.string "cousub_name"
  end

  create_table "vaccinations_age_municipality", force: :cascade do |t|
    t.string "county"
    t.string "town"
    t.string "age_group"
    t.integer "population"
    t.decimal "proportion_of_town_population"
    t.integer "individuals_with_at_least_one_dose"
    t.decimal "individuals_with_at_least_one_dose_per_capita"
    t.decimal "proportion_of_town_individuals_with_at_least_one_dose"
    t.integer "fully_vaccinated_individuals"
    t.decimal "fully_vaccinated_individuals_per_capita"
    t.decimal "proportion_of_town_fully_vaccinated_individuals"
    t.integer "partially_vaccinated_individuals"
    t.decimal "partially_vaccinated_individuals_per_capita"
    t.decimal "proportion_of_town_partially_vaccinated_individuals"
    t.date "report_date"
  end

  create_table "vaccinations_race_municipality", force: :cascade do |t|
    t.string "county"
    t.string "town"
    t.string "race_ethnicity"
    t.integer "population"
    t.decimal "proportion_of_town_population"
    t.integer "individuals_with_at_least_one_dose"
    t.decimal "individuals_with_at_least_one_dose_per_capita"
    t.decimal "proportion_of_town_individuals_with_at_least_one_dose"
    t.integer "fully_vaccinated_individuals"
    t.decimal "fully_vaccinated_individuals_per_capita"
    t.decimal "proportion_of_town_fully_vaccinated_individuals"
    t.integer "partially_vaccinated_individuals"
    t.decimal "partially_vaccinated_individuals_per_capita"
    t.decimal "proportion_of_town_partially_vaccinated_individuals"
    t.date "report_date"
  end

  create_table "vaccinations_sex_municipality", force: :cascade do |t|
    t.string "county"
    t.string "town"
    t.string "sex"
    t.integer "population"
    t.decimal "proportion_of_town_population"
    t.integer "individuals_with_at_least_one_dose"
    t.decimal "individuals_with_at_least_one_dose_per_capita"
    t.decimal "proportion_of_town_individuals_with_at_least_one_dose"
    t.integer "fully_vaccinated_individuals"
    t.decimal "fully_vaccinated_individuals_per_capita"
    t.decimal "proportion_of_town_fully_vaccinated_individuals"
    t.integer "partially_vaccinated_individuals"
    t.decimal "partially_vaccinated_individuals_per_capita"
    t.decimal "proportion_of_town_partially_vaccinated_individuals"
    t.date "report_date"
  end

end
