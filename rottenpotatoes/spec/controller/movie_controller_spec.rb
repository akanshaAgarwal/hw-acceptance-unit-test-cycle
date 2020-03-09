require "rails_helper"

RSpec.describe MoviesController, :type => :controller do
    describe 'GET similar_directors' do 
    it "should get called with apt parameters" do
        mv1 = Movie.new
        mv2 = Movie.new
        fake_results=[mv1,mv2]
        director = "ABC"
        title = "Alien"
        
        Movie.should_receive(:get_similar_directors).with(director).and_return(fake_results)

        get :similar_directors, :director => director, :title => title
    end
    it "should render similar_directors with same director movies" do
        mv1 = double("movie 2")
        mv2 = double("movie 1")
        fake_results=[mv1,mv2]
        director = "ABC"
        title = "Alien"
       
        Movie.stub(:get_similar_directors).with(director).and_return(fake_results)

        get :similar_directors, :director => director, :title => title
        response.should render_template('similar_directors')
        
    end
        it "should redirect_to home page when no director" do
        title = "Alien"
        get :similar_directors, :director => nil, :title => title
        response.should redirect_to('/movies')
        
    end
end
end