require 'test_helper'

class Api::MoviesControllerTest < ActionController::TestCase
  before do
    @controller = Api::MoviesController.new
  end

  describe 'index' do
    it 'return successful response' do
      get :index
      assert_equal 200, response.status
    end

    it 'has a movie property' do
      get :index
      assert_not JSON.parse(response.body)['movies'].blank?
    end
  end
end
