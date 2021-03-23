class CreateVaccinationTables < ActiveRecord::Migration[6.1]
  def change
    create_table :vaccinations_age_municipality do |t|
      t.string :county
      t.string :town
      t.string :age_group
      t.integer :population
      t.decimal :proportion_of_town_population
      t.integer :individuals_with_at_least_one_dose
      t.decimal :individuals_with_at_least_one_dose_per_capita
      t.decimal :proportion_of_town_individuals_with_at_least_one_dose
      t.integer :fully_vaccinated_individuals
      t.decimal :fully_vaccinated_individuals_per_capita
      t.decimal :proportion_of_town_fully_vaccinated_individuals
      t.integer :partially_vaccinated_individuals
      t.decimal :partially_vaccinated_individuals_per_capita
      t.decimal :proportion_of_town_partially_vaccinated_individuals
      t.date :report_date
    end
    
    create_table :vaccinations_race_municipality do |t|
      t.string :county
      t.string :town
      t.string :race_ethnicity
      t.integer :population
      t.decimal :proportion_of_town_population
      t.integer :individuals_with_at_least_one_dose
      t.decimal :individuals_with_at_least_one_dose_per_capita
      t.decimal :proportion_of_town_individuals_with_at_least_one_dose
      t.integer :fully_vaccinated_individuals
      t.decimal :fully_vaccinated_individuals_per_capita
      t.decimal :proportion_of_town_fully_vaccinated_individuals
      t.integer :partially_vaccinated_individuals
      t.decimal :partially_vaccinated_individuals_per_capita
      t.decimal :proportion_of_town_partially_vaccinated_individuals
      t.date :report_date
    end
    
    create_table :vaccinations_sex_municipality do |t|
      t.string :county
      t.string :town
      t.string :sex
      t.integer :population
      t.decimal :proportion_of_town_population
      t.integer :individuals_with_at_least_one_dose
      t.decimal :individuals_with_at_least_one_dose_per_capita
      t.decimal :proportion_of_town_individuals_with_at_least_one_dose
      t.integer :fully_vaccinated_individuals
      t.decimal :fully_vaccinated_individuals_per_capita
      t.decimal :proportion_of_town_fully_vaccinated_individuals
      t.integer :partially_vaccinated_individuals
      t.decimal :partially_vaccinated_individuals_per_capita
      t.decimal :proportion_of_town_partially_vaccinated_individuals
      t.date :report_date
    end
  end
end
