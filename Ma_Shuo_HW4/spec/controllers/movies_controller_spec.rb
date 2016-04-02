require 'spec_helper'

describe MoviesController do
	describe 'add director' do
    before :each do
      @m=double(Movie, :title => "Aladdin", :director => "director", :id => "1")
      Movie.stub(:find).with("1").and_return(@m)
    end
    
    it 'should call update_attributes and redirect' do
      @m.stub(:update_attributes!).and_return(true)
      put :update, {:id => "1", :movie => @m}
      response.should redirect_to(movie_path(@m))
    end
  end
  
  
  
  describe 'create and destroy' do
    it 'should create a new movie' do
      MoviesController.stub(:create).and_return(double('Movie'))
      post :create, {:id => "1"}
    end
    it 'should destroy a movie' do
      m = double(Movie, :id => "10", :title => "blah", :director => nil)
      Movie.stub(:find).with("10").and_return(m)
      m.should_receive(:destroy)
      delete :destroy, {:id => "10"}
    end
  end
end
