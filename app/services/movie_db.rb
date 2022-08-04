class MovieDb
  include HTTParty
  base_uri 'https://api.themoviedb.org/3'

  def initialize
    @options = { query: { api_key: ENV['MOVIE_DB_API_KEY'] } }
    @presenter = MoviePresenter.new
  end

  def now_playing
    movies = self.class.get('/movie/now_playing', @options)
    @presenter.present_collection(movies['results'])
  end

  def search_movies(query)
    @options[:query][:query] = query
    movies = self.class.get('/search/movie', @options)
    @presenter.present_collection(movies['results'])
  end
end
