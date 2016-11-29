require "sinatra"
require "pry"

require_relative "models/book"

set :bind, "0.0.0.0"
set :views, File.join(File.dirname(__FILE__), "views")
