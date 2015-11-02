require "sinatra"
require "sinatra/reloader" if development?
require "imdb"


get "/" do
  erb(:search)
end

get "/trivia" do
	erb(:trivia)
end

get "/search_results" do
	keyword = params[:search_keyword]
	search = Imdb::Search.new(keyword)
	@search = search.movies[0..19]
	@filtered_movies = @search.select { | movie | movie.poster != nil }
	@filtered_movies[0..9]
	@correct_movie = @search.sample
	erb(:search_results)
end

