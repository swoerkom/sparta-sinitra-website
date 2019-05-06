class API
  url = 'http://api.kanye.rest'
  uri = URI(url)
  response = Net::HTTP.get(uri)
  JSON.parse(response)
  puts response
end
