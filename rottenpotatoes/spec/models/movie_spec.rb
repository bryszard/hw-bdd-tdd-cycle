require 'rails_helper'

RSpec.describe Movie, type: :model do
  
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

end
