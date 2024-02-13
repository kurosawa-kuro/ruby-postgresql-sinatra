require 'sinatra'
require 'sinatra/activerecord'
require 'pg'

require './models/todo'

set :environment, :production

# todoの一覧を表示するページ
get '/' do
  @todos = Todo.all
  erb :todos
end
