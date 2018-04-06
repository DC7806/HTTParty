require 'rubygems'
require 'httparty'

class Resty
  
  include HTTParty
  base_uri "edutechional-resty.herokuapp.com/"

  def posts
    self.class.get('/posts.json')
  end

end

resty = Resty.new

puts resty.posts