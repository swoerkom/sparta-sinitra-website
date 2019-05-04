class FilmsController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, Proc.new {File.join(root, "views")}

  configure :development do
    register Sinatra::Reloader
  end

  get "/films" do
    @films = Films.all
    erb :'films/index'
  end

  post "/films" do
    film = Films.new
    film.filmid = post_data['filmid']
    film.filmname = post_data['filmname']
    film.director = post_data['director']
    film.genreid = post_data['genreid']
    film.save
    redirect "/films"
  end

  get "/films/new" do
    @films = Film.new
    erb :'films/new'
  end

  get "/films/:id/:edit" do
    id = params[:id].to_i
    @post = Post.find(id)
    erb :'films/edit'
  end

  delete "/films/:id" do
    id = params[:filmid].to_i
    Post.destory(id)
  redirect "/films"
  end

  put "/films/:id" do
    id = params[:filmid].to_i
    post = Post.find(id)
    film.filmid = post_data['filmid']
    film.filmname = post_data['filmname']
    film.director = post_data['director']
    film.genreid = post_data['genreid']
    film.save
    redirect "/films"

  end

  get "/films/:id" do
    id = params[:id].to_i
    @films = Films.find(id)
    erb :'films/shows'
  end

end
