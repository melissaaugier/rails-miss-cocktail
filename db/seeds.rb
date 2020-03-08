
require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drinks_serialized = open(url).read
drinks = JSON.parse(drinks_serialized)

puts "Creating ingredients ..."

drinks["drinks"].each do |drink|
  Ingredient.create!(name: drink["strIngredient1"])
end

puts 'Finished creating ingredients !'
