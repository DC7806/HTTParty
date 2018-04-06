require 'rubygems'
require 'httparty'

class Resty
  
  include HTTParty
  base_uri "edutechional-resty.herokuapp.com/"

  def posts
    self.class.get('/posts.json')
  end

end

response = Resty.new
response.posts.each do |post|
  puts "Title: #{post['title']} | Description: #{post['description']}"
end