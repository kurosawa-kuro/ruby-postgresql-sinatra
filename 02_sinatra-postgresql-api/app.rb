require 'sinatra'
require 'sinatra/contrib' # sinatra/json を使用するために必要
require 'pg'
require 'dotenv/load' # .envから環境変数を読み込むために必要

# データベース接続設定を環境変数から読み込む
conn_params = {
  host: ENV['DB_HOST'],
  dbname: ENV['DB_NAME'],
  user: ENV['DB_USER'],
  password: ENV['DB_PASSWORD']
}

set :environment, :production

# todoの一覧をJSON形式で返す
get '/' do
  conn = PG.connect(conn_params) # 修正されたデータベース接続設定を使用
  result = conn.exec('SELECT * FROM todos')

  todos = result.map do |row|
    { id: row['id'], title: row['title'] }
  end

  conn.close

  # JSON形式でレスポンスを返す
  json todos
end
