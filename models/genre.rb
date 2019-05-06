require 'pg'
class Genres
  attr_accessor(:genreid, :name)

  #Connect to the database
  def self.open_connection
  #Open connection to database
  connection = PG.connect(dbname: 'records')
  end

  def self.all
  connection = self.open_connection #Use method created above
  sql = "SELECT GenreID, name FROM genre ORDER BY GenreID"
  #PG Object is results
  results = connection.exec(sql)
  #Return an array of post object (results)
  genres = results.map do |genre| #MAP creates an array of posts
    self.hydrate(genre)
  end
  genres
end

def self.find(genreid) #Pass ID
  connection = self.open_connection
  sql = "SELECT * FROM genre WHERE GenreID = #{genreid} LIMIT 1" #Only return 1 (returns as an array)
  genres = connection.exec(sql)
  genre = self.hydrate(genres[0])
  genre
end

#Takes PG object
def self.hydrate(post_data) #Returns post object with the values (ID, title, body)
  genre = Genres.new
  genre.genreid = post_data['genreid']
  genre.name = post_data['name']
  genre
end

  def save
    connection = Genres.open_connection
    if(!self.genreid)
      sql = "INSERT INTO Genre (Name) VALUES ('#{self.name}')"
    else
      sql = "UPDATE Genre SET Name = '#{self.name}' WHERE GenreID = '#{self.genreid}'"
    end
    connection.exec(sql)
  end

  def self.destroy(genreid)
    connection = self.open_connection
    sql = "DELETE FROM Genre WHERE GenreID = #{genreid}"
    connection.exec(sql)
  end
end
