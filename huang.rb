require 'rubygems'
require 'httparty'
require 'byebug'

class Huangs
  
  include HTTParty
  base_uri "www.104.com.tw"

  def jobs
    self.class.get("http://www.104.com.tw/i/apis/jobsearch.cfm?c=5e3a44293446406a38583a1d1d1d1d5f2443a363189j01&fmt=8&cols=JOB,JOB_ADDR_NO_DESCRIPT,DESCRIPTION", format: :json)
    # @jobs = self.class.get("http://www.104.com.tw/i/apis/jobsearch.cfm?c=5e3a44293446406a38583a1d1d1d1d5f2443a363189j01&fmt=8&cols=JOB,JOB_ADDR_NO_DESCRIPT,DESCRIPTION", format: :json)
  end

end

# response = HTTParty.get("http://www.104.com.tw/i/apis/jobsearch.cfm?c=5e3a44293446406a38583a1d1d1d1d5f2443a363189j01&fmt=8&cols=JOB,JOB_ADDR_NO_DESCRIPT,DESCRIPTION", format: :json)

response = Huangs.new
byebug

response.jobs.parsed_response["data"].each do |collection|
  puts "title: #{collection["JOB"]}"
  puts "location: #{collection["JOB_ADDR_NO_DESCRIPT"]}"
  puts "description: #{collection["DESCRIPTION"].gsub("\n", "<br>")}"
  puts "-------------------------------------------------------------"
end


# response.parsed_response["data"].each do |collection|
#   puts "title: #{collection["JOB"]}"
#   puts "location: #{collection["JOB_ADDR_NO_DESCRIPT"]}"
#   puts "description: #{collection["DESCRIPTION"].gsub("\n", "<br>")}"
#   puts "-------------------------------------------------------------"
# end