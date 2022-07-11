require 'test_helper'

class Api::MoviesControllerTest < ActionController::TestCase
  before do
    VCR.use_cassette('movies controller', record: :none) do
      @controller = Api::MoviesController.new
      get :index
    end
  end

  describe 'index' do
    it 'return successful response' do
      assert_equal 200, response.status
    end

    it 'has a movie property' do
      assert_not JSON.parse(response.body)['movies'].blank?
    end
  end
end
