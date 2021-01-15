namespace :export do
  desc "Post CSV of the latest results to Slack"
  task current_csv: :environment do
    # Get the CSV
    csv = Csv.new('case_counts').execute
    # Post it to slack.
    
  end
end
