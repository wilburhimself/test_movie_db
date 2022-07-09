require 'test_helper'

class MovieDBTest < ActiveSupport::TestCase
  before do
    @movie_db = MovieDb.new
    @movies = @movie_db.now_playing
  end
  describe '.now_playing' do
    it 'should return a list of movies' do
      assert @movies['results'].size > 0
    end

    describe 'movie description' do
      it 'should have a title' do
        @movies['results'].each do |movie|
          assert_not movie['original_title'].nil? 
        end
      end

      it 'should have a release_date' do
        @movies['results'].each do |movie|
          assert_not movie['release_date'].nil? 
        end
      end
    end
  end
end
