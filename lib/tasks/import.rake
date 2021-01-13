require 'date'
require 'faraday'

namespace :import do
  desc "Import weekly covid data from the Commonwealth of Massachusetts"
  task weekly_covid_data: :environment do
    # download COVID data from MA website using format
    # https://www.mass.gov/doc/weekly-public-health-report-raw-data-december-24-2020/download
    # #{Date.today.strftime('%B-%d-%Y').downcase}
    File.open(Rails.root.join("tmp/weekly-public-health-report-raw-data-#{Date.today.strftime('%B-%d-%Y').downcase}.xlsx"), 'w:ASCII-8BIT') do |file|
      file.write(Faraday.get("https://www.mass.gov/doc/weekly-public-health-report-raw-data-january-7-2021/download").body)
    end
  end

end
