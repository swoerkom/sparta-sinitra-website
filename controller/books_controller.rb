class BooksController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, Proc.new {File.join(root, "views")}

  configure :development do
    register Sinatra::Reloader
  end

  get "/books" do
    @books = Books.all
    @genre = Genres.all
    erb :'books/index'
  end

  post "/books" do
    book = Books.new
    book.bookid = params['bookid']
    book.bookname = params['bookname']
    book.author = params['author']
    book.genreid = params['genreid']
    book.save
    redirect "/books"
  end

  get "/books/:id/:edit" do
    id = params[:id].to_i
    @book = Books.find(id)
    erb :'books/edit'
  end

  delete "/books/:id" do
    id = params[:id].to_i
    Books.destroy(id)
    redirect "/books"
  end

  put "/books/:id" do
    id = params[:id].to_i
    book = Books.find(id)
    book.bookname = params['bookname']
    book.author = params['author']
    book.genreid = params['genreid']
    book.save
    redirect "/books"
  end

  get "/books/:id" do
    id = params[:id].to_i
    @books = Books.find(id)
    erb :'books/shows'
  end

end
