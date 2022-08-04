class Api::MoviesController < ApplicationController
  def index
    render json: { movies: MovieDb.new.now_playing }
  end
  
  def search
    query = params[:query]
    render json: { movies: MovieDb.new.search_movies(query) }
  end
end
