import React, {useEffect, useState} from 'react'
import * as ReactDOM from 'react-dom/client';
import PropTypes from 'prop-types'
import axios from 'axios'

const Movies = () => {
  const [movies, setMovies] = useState([])
  const [searchQuery, setSearchQuery] = useState(null)

  useEffect(() => {
    axios.get('/api/movies').then((response) => {
      setMovies(response.data.movies)
    })
  }, [])

  useEffect( () => {
    searchMovies(searchQuery)
  }, [searchQuery]) 

  const formatDate = (date) => {
    const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' }
    const dd = new Date(date)
    return dd.toLocaleDateString('en-US', options)
  }

  const searchMovies = async (query) => {
    await axios.get(`/api/search?query=${query}`).then((response) => {
      setMovies(response.data.movies)
    })
  }

  return (
    <div className="movies-container">
      <h2>Movies</h2>

      <input type="text" onChange={(event) => { setSearchQuery(event.target.value) }} placeholder="Type the name of your movie ..." />

      <ol>
        {movies.map((movie, index) => (
          <li key={`movie-${index}`}>
            <h4>{movie.title}</h4>
            <small>Release date: {formatDate(movie.release_date)}</small>
          </li>
        ))}
      </ol>
    </div>
  )
}

document.addEventListener('DOMContentLoaded', () => {
  const root = ReactDOM.createRoot(document.getElementById('movie-list'))
  root.render(<Movies />)
})
