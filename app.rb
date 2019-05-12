require "sinatra"
require "sinatra/reloader" if development?
require_relative "database"
require_relative './lib/article.rb'

helpers do
  def partial(template, locals = {})
    erb(template, layout: false, locals: locals)
  end
end

get "/" do
  @database = DB
  erb :home
end

get '/articles/:id' do
  @article = DB[params[:id].to_i]
  @photo = @article[:photo].nil? ? 'https://unsplash.it/1600?image=8' : @article[:photo].gsub('600', '1600')
  @lecture_time = lecture_time(@article[:content])
  @comments = COMMENTS[params[:id].to_i]
  erb :article
end
