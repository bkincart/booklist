require "sinatra"
require "pry"

set :bind, "0.0.0.0"
set :views, File.join(File.dirname(__FILE__), "views")
