require 'active_record'
require 'yaml'
require './models/todo'

# データベース設定をロード
db_config = YAML.load_file('config/database.yml')
ActiveRecord::Base.establish_connection(db_config['development'])

# マイグレーションタスクの定義
namespace :db do
  desc "Migrate the database"
  task :migrate do
    ActiveRecord::MigrationContext.new('db/migrate', ActiveRecord::SchemaMigration).migrate
    puts 'Database has been migrated'
  end

  desc "Load the seed data from db/seeds.rb"
  task :seed do
    load 'db/seeds.rb'
  end
end
