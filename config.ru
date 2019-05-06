require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/reloader' if development?
require 'pg'
require 'net/http'
require 'json'
require_relative './models/films'
require_relative './models/books'
require_relative './models/genre'
require_relative './models/api'
require_relative './controller/homepage_controller'
require_relative './controller/films_controller'
require_relative './controller/books_controller'
require_relative './controller/books_controller'
require_relative './controller/genre_controller'




use Rack::MethodOverride
run HomePageController
use FilmsController
use BooksController
use GenreController
