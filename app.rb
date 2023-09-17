require 'sinatra'

get '/' do
  'Hello world!'
end

get '/search/isbn/:isbn' do |isbn|
  redirect amazon_search_url(isbn)
end

get '/search/title/:title' do |title|
  redirect amazon_search_url(title)
end

def amazon_search_url(query)
  "https://www.amazon.se/s?k=#{query}"
end