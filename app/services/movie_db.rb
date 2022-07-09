class MovieDb
  include HTTParty
  base_uri 'https://api.themoviedb.org/3'

  def initialize
    @options = { query: { api_key: ENV['MOVIE_DB_API_KEY'] } }
  end

  def now_playing
    self.class.get('/movie/now_playing', @options)
  end
end
