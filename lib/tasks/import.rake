require 'date'
require 'faraday'
require 'rubyXL'
require 'rubyXL/convenience_methods/workbook'
require 'rubyXL/convenience_methods/worksheet'

namespace :import do
  desc "Import weekly covid data from the Commonwealth of Massachusetts"
  task :weekly_covid_data, [:date] => :environment do |task, args|
    report_date = Date.strptime(args[:date]) || Date.today
    File.open(Rails.root.join("tmp/weekly-public-health-report-raw-data-#{report_date.strftime('%B-%-d-%Y').downcase}.xlsx"), 'w:ASCII-8BIT') do |file|
      file.write(
        Faraday.new do |faraday| 
          faraday.use Faraday::Response::RaiseError
          faraday.adapter Faraday.default_adapter
        end.get("https://www.mass.gov/doc/weekly-public-health-report-raw-data-#{report_date.strftime('%B-%-d-%Y').downcase}/download")
           .body
      )
    end
    
    workbook = RubyXL::Parser.parse(Rails.root.join("tmp/weekly-public-health-report-raw-data-#{report_date.strftime('%B-%-d-%Y').downcase}.xlsx"))
    city_town_worksheet = workbook[3]
    
    raise StandardError.new('Workbook format changed. Please inspect the workbook and update the rake task with the correct worksheet.') if city_town_worksheet[0][0].value != 'City/Town'
    
    city_town_worksheet.each_with_index do |row, index|
      next if index == 0
      next if row[0].value == ('Unknown' || 'Unknown town')
      next if row[0].value == 'State'
      
      if report_date > Date.strptime('2021-01-01')
        CaseCount.create(
          municipality: row[0].value,
          county: row[1].value,
          population: row[2].value,
          total_case_counts: row[3].value,
          two_week_case_counts: get_two_week_case_counts(row[4]),
          average_daily_rate: row[5].value,
          change_in_last_week: row[6].value,
          total_tests: row[7].value,
          total_tests_last_two_weeks: row[8].value,
          total_positive_tests: row[9].value,
          percent_positivity: get_percent_positivity(row[10]),
          change_since_last_week: row[11].value,
          testing_rate: row[12].value,
          report: report_date.iso8601
        )
      else
        CaseCount.create(
          municipality: row[0].value,
          total_case_counts: row[1].value,
          two_week_case_counts: get_two_week_case_counts(row[2]),
          average_daily_rate: row[3].value,
          change_in_last_week: row[4].value,
          total_tests: row[5].value,
          total_tests_last_two_weeks: row[6].value,
          total_positive_tests: row[7].value,
          percent_positivity: get_percent_positivity(row[8]),
          change_since_last_week: row[9].value,
          report: report_date.iso8601
        )
      end
    end
  end
end

private

def get_percent_positivity(cell)
  if cell.value.class == Float || cell.value.class == Integer
    cell.value
  else
    cell.value.match(/\d+\.?\d+?/)[0]
  end
end

def get_two_week_case_counts(cell)
  if cell.value.class == Integer
    cell.value
  else
    cell.value.match(/\d+/)[0]
  end
end
