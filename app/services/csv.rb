require 'fileutils'
require 'csv'

class Csv
  CACHE_DIR = 'public/cache'.freeze

  def initialize(params)
    @table_name = params
  end

  def to_csv(table_name)
    template = ERB.new File.new('config/database.yml').read
    @settings = YAML.load template.result(binding)
    
    arguments = []
    arguments << %(-c "\\copy \(SELECT * FROM #{table_name})

    arguments << %(\) to '#{File.join(CACHE_DIR, "#{table_name}.csv")}' with csv header")
    arguments << %(-w -d #{Rails.configuration.database_configuration[Rails.env]['database']})
    
    arguments << %(-h #{@settings['default']['host']} -p #{@settings['default']['port']} -U #{@settings['default']['username']}) if Rails.env != 'development'
    # binding.irb
    
    psql_out = `psql #{arguments.join(' ')} 2>&1`
    FileUtils.mkdir_p('log')
    File.open('log/psql.log', 'a') { |file| file.write(psql_out) }

    puts arguments.join(' ')

    table_name
  end

  def execute
    FileUtils.mkdir_p(CACHE_DIR)
    unless File.file?(File.join(CACHE_DIR, "#{@table_name}.csv"))
      to_csv(@table_name)
    end

    File.join(CACHE_DIR, "#{@table_name}.csv")
  end
end