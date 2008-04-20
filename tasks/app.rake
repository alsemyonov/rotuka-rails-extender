namespace :app do
  namespace :models do
    desc "Completele update and annotate models"
    task :update => ['db:migrate', 'annotate_models']

    desc "Save application data to fixtures"
    task :fixturease => 'app:models:fixtures:save'
  end

  desc "Reload application data"
  task :reload => ['app:models:update', 'db:fixtures:load'] do
    puts "Data reloaded"
  end

  desc "Recreate, remigrate and load fixtures"
  task :recreate => ['db:reset', 'app:reload'] do
    puts "Application recreated"
  end
  
  desc "Creating initially data"
  task :init => :environment do

  end
end