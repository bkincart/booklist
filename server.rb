require "sinatra"
require "pry"

require_relative "models/book"

set :bind, "0.0.0.0"
set :views, File.join(File.dirname(__FILE__), "views")

get "/" do
  redirect to "/books"
end

get "/books" do
  @books = Book.all
  erb :"books/index"
end

get "/books/new" do
  erb :"books/new"
end

post "/books" do
  book = Book.new(params)
  book.save
  redirect to "/books"
end
