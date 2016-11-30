require "csv"

class Book

  def save
    CSV.open(Book.csv_file, "ab", Book.csv_options) do |csv|
      csv << [title, author, description]
    end
  end

  def self.all
    result = []
    CSV.foreach(csv_file, csv_options) do |row|
      result << Book.new(row.to_hash)
    end
    result
  end

  def self.csv_file
    if ENV["RACK_ENV"] == "test"
      return File.join(File.dirname(__FILE__), "..", "data", "books_test.csv")
    else
      return File.join(File.dirname(__FILE__), "..", "data", "books.csv")
    end
  end

  def self.csv_options
    {
      col_sep: ";",
      headers: true
    }
  end

  def self.reset_csv
    CSV.open(Book.csv_file, "wb", Book.csv_options) do |csv|
      csv << ["title", "author", "description"]
    end
  end
end
