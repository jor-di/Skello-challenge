require "sinatra"
require "sinatra/reloader" if development?
require_relative "database"
require_relative './lib/article.rb'

helpers do
  def partial(template, locals = {})
    erb(template, layout: false, locals: locals)
  end
end

database = DB.each_with_index do |art, ind|
  art[:comments] = COMMENTS[ind].size
  art[:id] = ind
end

get "/" do
  @last_articles = database.reverse
  @top_commented_articles = database.sort_by { |article| article[:comments] || 0 }.reverse
  @top_rated_articles = database.sort_by { |article| article[:rating] || "0" }.reverse
  erb :home
end

get '/articles/:id' do
  @article = DB[params[:id].to_i]
  @photo = @article[:photo].nil? ? 'https://unsplash.it/1600?image=8' : @article[:photo].gsub('600', '1600')
  @lecture_time = lecture_time(@article[:content])
  @comments = COMMENTS[params[:id].to_i]
  erb :article
end
