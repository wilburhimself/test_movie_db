class Api::MoviesController < ApplicationController
  def index
    render json: { movies: MovieDb.new.now_playing }
  end
end
