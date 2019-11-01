require 'http'
require 'awesome_print'

while true

  p "Enter a word: "
  user_word = gets.chomp.downcase

  if user_word == "q"
    break
  end

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{user_word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=YOURAPI")

  definitions = response.parse
 
  definitions.each do |definition|
    p definition["text"]
  end

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{user_word}/topExample?useCanonical=false&api_key=YOURAPI")

  top_example = response.parse["text"]
  p top_example

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{user_word}/pronunciations?useCanonical=false&limit=50&api_key=YOURAPI")

  pronounciation = response.parse[0]["raw"]
  p pronounciation

end
