require 'pg'
class Books
  attr_accessor(:bookid, :bookname, :author, :genreid)

  def self.open_connection
    connection = PG.connect(dbname: 'records')
  end

  def self.all
    connection = self.open_connection #Use method created above
    sql = "SELECT BookiD, BookName, Author, GenreID FROM books ORDER BY bookID"
    #PG Object is results
    results = connection.exec(sql)
    #Return an array of post object (results)
    books = results.map do |book| #MAP creates an array of posts
      self.hydrate(book)
    end
    books
  end

  def self.find(bookid) #Pass ID
    connection = self.open_connection
    sql = "SELECT * FROM Books WHERE BookID = #{bookid} LIMIT 1" #Only return 1 (returns as an array)
    books = connection.exec(sql)
    book = self.hydrate(books[0])
    book
  end

  #Takes PG object
  def self.hydrate(post_data) #Returns post object with the values (ID, title, body)
    book = Books.new
    book.bookid = post_data['bookid']
    book.bookname = post_data['bookname']
    book.author = post_data['author']
    book.genreid = post_data['genreid']
    book
  end

  def save
    connection = Books.open_connection
    if(self.bookid != "")
      sql = "INSERT INTO Books (bookname, author, genreid) VALUES ('#{self.bookname}','#{self.author}', '#{self.genreid}')"
    else
      sql = "UPDATE Books SET bookname = '#{self.bookname}', author = '#{self.author}', genreid = '#{self.genreid}' WHERE bookid = '#{self.bookid}'"
    end
    connection.exec(sql)
  end

  def self.destroy(bookid)
    connection = self.open_connection
    sql = "DELETE FROM books WHERE bookID = #{bookid}"
    connection.exec(sql)
  end
end
