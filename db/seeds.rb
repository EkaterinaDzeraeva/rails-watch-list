require "json"
require "open-uri"



puts "Starting the seeding"

url = "https://tmdb.lewagon.com/movie/top_rated?&language=en-US&page=1"

results = URI.open(url).read

# movies = results.results
all_movies = JSON.parse(results)
# p all_movies["results"]


all_movies["results"].take(10).each do |m|
  movie = Movie.new(
    title: m["title"],
    overview: m["overview"],
    poster_url: m["poster_path"],
    rating: m["vote_average"].to_i
  )
  movie.save
end

puts "End of seeding"
