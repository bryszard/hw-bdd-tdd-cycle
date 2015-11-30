

Given /the following movies exist/ do |movies|
    
    movies.hashes.each do |movie|
        Movie.create! movie
    end
    
end


Then /the director of "(.*)" should be "(.*)"/ do |title, director|

    if page.respond_to? :should
        page.should have_content( director )
        page.should have_content( title )
    else
        assert page.has_content?( director )
    end
end

=begin
Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |movie_title, movie_director| 
  page.all('ul#details li').each do |el|
    if el.text =~ /Director:/
      expect(el.text).to have_content(movie_director)
    end
  end
end
=end