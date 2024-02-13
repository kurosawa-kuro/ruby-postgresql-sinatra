require 'sinatra'
require 'sinatra/contrib' # または require 'sinatra/json' を使用しても構いませんが、sinatra-contribが必要です
require 'pg'

# データベース接続設定
set :db_config, {
  host: 'localhost',
  dbname: 'development_db',
  user: 'dev_user',
  password: 'dev_password'
}

set :environment, :production

# todoの一覧をJSON形式で返す
get '/' do
  conn = PG.connect(settings.db_config)
  result = conn.exec('SELECT * FROM todos')

  todos = result.map do |row|
    { id: row['id'], title: row['title'] }
  end

  conn.close

  # JSON形式でレスポンスを返す
  json todos
end
