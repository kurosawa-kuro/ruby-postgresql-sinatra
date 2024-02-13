require 'sinatra'
require 'pg'
require 'dotenv/load' # 追加

# データベース接続設定
conn_params = {
  host: ENV['DB_HOST'],
  dbname: ENV['DB_NAME'],
  user: ENV['DB_USER'],
  password: ENV['DB_PASSWORD']
}

set :environment, :production

# todoの一覧を表示するページ
get '/' do
  conn = PG.connect(conn_params) # 修正
  result = conn.exec('SELECT * FROM todos')

  @todos = result.map do |row|
    { id: row['id'], title: row['title'] }
  end

  conn.close

  erb :todos # HTMLテンプレートをレンダリング
end
