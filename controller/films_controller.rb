class FilmsController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, Proc.new {File.join(root, "views")}

  configure :development do
    register Sinatra::Reloader
  end

  get "/films" do
    @films = Films.all
    @genre = Genres.all
    erb :'films/index'
  end

  post "/films" do
    film = Films.new
    film.filmid = params['filmid']
    film.filmname = params['filmname']
    film.director = params['director']
    film.genreid = params['genreid']
    film.save
    redirect "/films"
  end

  get "/films/:id/:edit" do
    id = params[:id].to_i
    @film = Films.find(id)
    erb :'films/edit'
  end

  delete "/films/:id" do
    id = params[:id].to_i
    Films.destroy(id)
  redirect "/films"
  end

  put "/films/:id" do
    id = params[:id].to_i
    film = Films.find(id)
    film.filmname = params['filmname']
    film.director = params['director']
    film.genreid = params['genreid']
    film.save
    redirect "/films"
  end

  get "/films/:id" do
    id = params[:id].to_i
    @films = Films.find(id)
    erb :'films/shows'
  end

end
