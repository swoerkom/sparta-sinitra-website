require 'pg'
class Films
  attr_accessor(:filmid, :filmname, :director, :genreid)

  #Connect to the database
  def self.open_connection
  #Open connection to database
  connection = PG.connect(dbname: 'records')
  end

  def self.all
  connection = self.open_connection #Use method created above
  sql = "SELECT FilmID, FilmName, Director, GenreID FROM Films ORDER BY FilmID"
  #PG Object is results
  results = connection.exec(sql)
  #Return an array of post object (results)
  films = results.map do |film| #MAP creates an array of posts
    self.hydrate(film)
  end
  films
end

def self.find(filmid) #Pass ID
  connection = self.open_connection
  sql = "SELECT * FROM Films WHERE FilmID = #{filmid} LIMIT 1" #Only return 1 (returns as an array)
  films = connection.exec(sql)
  film = self.hydrate(films[0])
  film
end

#Takes PG object
def self.hydrate(post_data) #Returns post object with the values (ID, title, body)
  film = Films.new
  film.filmid = post_data['filmid']
  film.filmname = post_data['filmname']
  film.director = post_data['director']
  film.genreid = post_data['genreid']
  film
end

def save
    connection = Films.open_connection
    if(!self.filmid)
      sql = "INSERT INTO Films (filmname, director, genreid) VALUES ('#{self.filmname}','#{self.director}', 2)"
    else
      sql = "UPDATE Films SET filmname = '#{self.filmname}', director = '#{self.director}' WHERE filmid = '#{self.filmid}'"
    end
    connection.exec(sql)
  end

  def self.destroy(filmid)
    connection = self.open_connection
    sql = "DELETE FROM Films WHERE FilmID = #{filmid}"
    connection.exec(sql)
  end
end
