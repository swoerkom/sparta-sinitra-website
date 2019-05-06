class HomePageController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, Proc.new {File.join(root, "views")}

  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    @films = Films.all
    @books = Books.all
    @genre = Genres.all
    erb :'homepage/index'
  end

  #New
  get "/new" do
    @film = Films.new
    @book = Books.new
    @genre = Genres.new
    erb :'new'
  end

  post "/new" do
      film = Films.new
      film.filmid = params['filmid']
      film.filmname = params['filmname']
      film.director = params['director']
      film.genreid = params['genreid']
      film.save

      book = Books.new
      book.bookid = params['bookid']
      book.bookname = params['bookname']
      book.author = params['author']
      book.genreid = params['genreid']
      book.save

      genre = Genres.new
      genre.genreid = params['genreid']
      genre.name = params['name']
      puts "Test"
      redirect "/"
  end

end
