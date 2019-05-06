class GenreController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, Proc.new {File.join(root, "views")}

  configure :development do
    register Sinatra::Reloader
  end

  get "/genres" do
    @genres = Genres.all
    erb :'genres/index'
  end

  post "/genres" do
    genre = Genres.new
    genre.genreid = params['genreid']
    genre.name = params['name']
    genre.save
    redirect "/genres"
  end

  get "/genres/:id/:edit" do
    id = params[:id].to_i
    @genre = Genres.find(id)
    erb :'genres/edit'
  end

  delete "/genres/:id" do
    id = params[:id].to_i
    Genres.destroy(id)
  redirect "/genres"
  end

  put "/genres/:id" do
    id = params[:id].to_i
    genre = Genres.find(id)
    genre.genreid = params['genreid']
    genre.name = params['name']
    genre.save
    redirect "/genres"
  end

  get "/genres/:id" do
    id = params[:id].to_i
    @genres = Genres.find(id)
    erb :'genres/shows'
  end

end
