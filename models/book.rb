require "csv"

class Book
  attr_reader :title, :author, :rating, :url

  def initialize(attributes = {})
    @title = attributes["title"]
    @author = attributes["author"]
    @rating = attributes["rating"]
    @url = attributes["url"]
  end

  def save
    CSV.open(Book.csv_file, "ab", Book.csv_options) do |csv|
      csv << [title, author, rating, url]
    end
  end

  class << self
    def all
      result = []
      CSV.foreach(csv_file, csv_options) do |row|
        result << Book.new(row.to_hash)
      end
      result
    end

    def csv_file
      if ENV["RACK_ENV"] == "test"
        return File.join(File.dirname(__FILE__), "..", "data", "books_test.csv")
      else
        return File.join(File.dirname(__FILE__), "..", "data", "books.csv")
      end
    end

    def csv_options
      {
        col_sep: ";",
        headers: true
      }
    end

    def reset_csv
      CSV.open(Book.csv_file, "wb", Book.csv_options) do |csv|
        csv << ["title", "author", "rating", "url"]
      end
    end
  end
end
