require 'rubygems'
require 'httparty'

class Stack
  
  include HTTParty
  base_uri "api.stackexchange.com"

  def initialize(service, page)
    @options = {query: {site: service}}
  end

  def questions
    self.class.get('/2.2/questions', @options)
  end

  def users
    self.class.get('/2.2/users', @options)
  end

end

stack_exchange = Stack.new('stackoverflow', 1)

puts '----------------------Start Questions-----------------------'
puts stack_exchange.questions
puts '----------------------Start Users-----------------------'
puts stack_exchange.users

