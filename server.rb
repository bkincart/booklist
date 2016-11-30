require "sinatra"
require "pry"
require "csv"


require_relative "models/book"

set :bind, "0.0.0.0"
set :views, File.join(File.dirname(__FILE__), "views")


get "/" do
  redirect to("/books")
end

get "/books" do
  @books = []
  CSV.foreach(csv_file, headers: true) do |row|
    @books << row.to_h
  end
  erb :"books/index"
end


# Helper Methods

def csv_file
  if ENV["RACK_ENV"] == "test"
    "data/books_test.csv"
  else
    "data/books.csv"
  end
end

def reset_csv
  CSV.open(csv_file, "w", headers: true) do |csv|
    csv << ["title", "author", "genre"]
  end
end
