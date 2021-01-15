FactoryBot.define do
  factory :case_count do
    municipality { "Boston" }
    county { "Suffolk" }
    population { 16598 }
    total_case_counts { 701 }
    two_week_case_counts { 143 }
    average_daily_rate { "61.5391584567178" }
    change_in_last_week { "Higher" }
    total_tests { 17389 }
    total_tests_last_two_weeks { 1978 }
    total_positive_tests { 158 }
    percent_positivity { 0.0798786653185035 }
    change_since_last_week { "Higher" }
    testing_rate { 11917.0795523317 }
    report { Date.today.iso8601 }
  end
end
