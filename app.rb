require "sinatra"
require "sinatra/reloader" if development?
require_relative "database"

get "/" do
  @database = DB
  erb :home
end

get '/articles/:id' do
  @article = DB[params[:id].to_i]
  @comments = COMMENTS[params[:id].to_i]
  erb :article
end
