require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

=begin
    describe "Getting movies with same director" do
        fixtures :movies
        it "should get you to the right page"  do
           fake = instance_double('Movie', :director => 'Sofia Coppolla')
           fake2= instance_double('Movie', :director => 'John Lennon')
           fake3= instance_double('Movie', :director => 'Paul')
           
           allow(Movie).to receive(:find).and_return(fake)
           allow(Movie).to receive(:where).and_return([fake2,fake3])
           get :same_director, :id=>1
           expect(response).to render_template(:same_director)
       end
        it "Should return the movies with the same director" do
           movie1_director1=movies(:movie1)
           movie2_director1=movies(:movie2)
           movie3_director2=movies(:movie3)
           some_id=1
           
           get :same_director, :id=>some_id
           expect(Movie.find(some_id)).to eq(movie1_director1)
           expect(Movie.where(director: movie1_director1.director)).to match_array([movie1_director1,movie2_director1])
        end
        
       
        it "Should redirect you to the homepage" do
           movie4_no_director=movies(:movie4)
           some_id=4
           
           get :same_director, :id=>some_id
           expect(Movie.find(some_id)).to eq(movie4_no_director)
           expect(Movie.where(director: movie4_no_director)).to eq(movie4_no_director)
           expect(response).to redirect_to(root_path)
           
        end
     
       
    end
    
end

=end
#expect(response).to render_template(:directors)
#fake = instance_double('Movie', :director => 'Sofia Coppolla')

require 'rails_helper'

describe MoviesController do
    describe 'Routing for searching movies for same director: ' do
        before :each do
            @any_possible_id = 1
            @movie1 = instance_double('Movie', id:1, title:'movie1')
            @movie2 = instance_double('Movie', id:2, title:'movie2')
            allow(Movie).to receive(:find) {@movie1}
        end
        context '1- When Movie has a director info, ' do
            it 'should render a especialized view for the requested feature.' do
                allow(@movie1).to receive(:similar_directors).and_return([@movie1,@movie2])
                get :directors, :id=>@any_possible_id
                expect(response).to render_template(:directors)
            end
        end
        context '2- When Movie has no director info, ' do
            it 'should redirect to the index view for the requested feature.' do
                allow(@movie1).to receive(:similar_directors).and_return([@movie1])
                get :directors, :id=>@any_possible_id
                expect(response).to redirect_to(root_path)
            end
        end
    end
end 

=begin
    describe Movie do
        describe 'model searching movies with same directors: ' do
            fixtures :movies
            before :each do
                #The following lines cannot run inside Example groups of RSpec
                #@test_movie_1 = Movie.new(title: "movie_1", director: "director_1")
                #@test_movie_2 = Movie.new(title: "movie_2", director: "director_2")
                @movie_director_known_1 = movies(:movie1)
                @movie_director_known_2 = movies(:movie2)
                @movie_director_unknown = movies(:movie4)
            end
            context '1- When movie has a director info, ' do
                it 'should retrieve movies with the same director.' do
                    expect(@movie_director_known_1.similar_directors).to match_array([@movie_director_known_1,@movie_director_known_2])
                end
            end
            context '2- When movie has no director info, ' do
                it 'should not find movies by different directors.' do
                    expect(@movie_director_unknown.similar_directors).to match_array([@movie_director_unknown])
                end
            end
        end
    end
=end
end