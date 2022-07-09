class Api::MoviesController < ApplicationController
  def index
    render json: { message: 'hello' }
  end
end
