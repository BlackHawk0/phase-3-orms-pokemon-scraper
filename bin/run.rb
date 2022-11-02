require_relative "environment"

Scraper.new(@db).scrape

all_pokemon = @db.execute("SELECT * FROM pokemon;")

# test out your code here!
Pokemon.new(id: 1, name: "Pikachu", type: "electric", db: @db)
Pokemon.save("Pikachu", "electric", @db)
puts Pokemon.find(1, @db)