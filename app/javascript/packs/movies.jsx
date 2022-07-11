import React, {useEffect, useState} from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import axios from 'axios'

const Movies = () => {
  const [movies, setMovies] = useState([])

  useEffect(() => {
    axios.get('/api/movies').then((response) => {
      setMovies(response.data.movies)
    })
  }, [])

  const formatDate = (date) => {
    const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' }
    const dd = new Date(date)
    return dd.toLocaleDateString('en-US', options)
  }

  return (
    <div className="movies-container">
      <h2>Movies</h2>
      <ol>
        {movies.map((movie) => (
          <li>
            <h4>{movie.title}</h4>
            <small>Release date: {formatDate(movie.release_date)}</small>
          </li>
        ))}
      </ol>
    </div>
  )
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Movies />,
    document.body.appendChild(document.createElement('div')),
  )
})
