require 'test_helper'

describe MoviePresenter do
  before do
    PRESENTABLE_FIELDS = %i(title release_date)
    @presenter = MoviePresenter.new
  end

  MOVIES = [{"adult"=>false, "backdrop_path"=>"/wcKFYIiVDvRURrzglV9kGu7fpfY.jpg", "genre_ids"=>[14, 28, 12], "id"=>453395, "original_language"=>"en", "original_title"=>"Doctor Strange in the Multiverse of Madness", "overview"=>"Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.", "popularity"=>6343.173, "poster_path"=>"/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg", "release_date"=>"2022-05-04", "title"=>"Doctor Strange in the Multiverse of Madness", "video"=>false, "vote_average"=>7.5, "vote_count"=>4122}]

  describe '.present' do
    it 'should have the required fields' do
      PRESENTABLE_FIELDS.each do |field| 
        assert @presenter.present(MOVIES[0])[field] == MOVIES[0][field.to_s]
      end
    end

    it 'should have only the presentable_fields' do
      assert PRESENTABLE_FIELDS == @presenter.present(MOVIES[0]).keys
    end
  end
  
  describe '.present_collection' do
    before do
      @presenter = MoviePresenter.new
    end
    it 'should have an array of movies' do
      collection = @presenter.present_collection(MOVIES)
      assert collection.size == 1
    end
  end
end
