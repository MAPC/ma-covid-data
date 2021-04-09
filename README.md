# README

## CRON Jobs

```
7 20 * * 4  cd /var/www/ma-covid-data/current && RAILS_ENV=production /home/ma-covid-data/.rvm/gems/ruby-2.7.3/bin/bundle exec rake import:weekly_covid_data[$(date +"\%Y-\%m-\%d")] 2>&1 | /usr/bin/logger -t ma_covid_data
12 20 * * 4 cd /var/www/ma-covid-data/current && RAILS_ENV=production /home/ma-covid-data/.rvm/gems/ruby-2.7.3/bin/bundle exec rake import:weekly_vaccination_data[$(date +"\%Y-\%m-\%d")] 2>&1 | /usr/bin/logger -t ma_covid_data
```
