class CreateCaseCounts < ActiveRecord::Migration[6.1]
  def change
    create_table :case_counts do |t|
      t.string :municipality
      t.string :county
      t.integer :population
      t.integer :total_case_counts
      t.integer :two_week_case_counts
      t.decimal :average_daily_rate
      t.string :change_in_last_week
      t.integer :total_tests
      t.integer :total_tests_last_two_weeks
      t.integer :total_positive_tests
      t.decimal :percent_positivity
      t.string :change_since_last_week
      t.decimal :testing_rate
      t.date :report

      t.timestamps
    end
  end
end
