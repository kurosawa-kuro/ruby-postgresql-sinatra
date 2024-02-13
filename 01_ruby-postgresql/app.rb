require 'pg'
require 'dotenv'
Dotenv.load

# データベース接続情報
conn_params = {
  host: ENV['DB_HOST'],
  dbname: ENV['DB_NAME'],
  user: ENV['DB_USER'],
  password: ENV['DB_PASSWORD']
}

begin
  # データベースに接続
  conn = PG.connect(conn_params)

  # SQLクエリの実行
  result = conn.exec('SELECT * FROM todos')

  # 結果の出力
  result.each do |row|
    puts "ID: #{row['id']}, Title: #{row['title']}"
  end

ensure
  # データベース接続を閉じる
  conn&.close
end