class MoviePresenter
  def present(movie)
    {
      title: movie['original_title'],
      release_date: movie['release_date']
    }
  end

  def present_collection(movies)
    movies.map{ |movie| self.present(movie) }
  end
end
