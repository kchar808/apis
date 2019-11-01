require 'http'
require 'awesome_print'

while true

  p "Enter a word: "
  user_word = gets.chomp.downcase

  if user_word == "q"
    break
  end

#   response = HTTP.get("https://api.wordnik.com/v4/word.json/#{user_word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=YOURAPIKEY")

#   definition = response.parse[0]["text"]

#   p definition

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{user_word}/topExample?useCanonical=false&api_key=YOURAPIKEY")

  top_example = response.parse["text"]
  p top_example

end
