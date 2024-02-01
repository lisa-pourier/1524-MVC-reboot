require_relative '../views/books_view'

class BooksController
  def initialize
    @view = BooksView.new
  end

  def list
    # Fetch ALL the books from Active Record
    books = Book.all
    # Display all books in View
    @view.display(books)
    # display
  end

  # p list

  # def display ---> not supposed to be here, BUT in VIEW

  #     # books.each_with_index do |book, index|
  #     #   puts "#{title}, #{category}, #{price}, #{author}"
  #     end
  # end

  def add
    # Ask for title => View
    # Ask for price
    # Ask for author
    # Ask for category
    title = @view.ask_for("title")
    price = @view.ask_for("price").to_i
    author = @view.ask_for("author")
    category = @view.ask_for("category")
    # Active Record
    # Create a new book
    # Save a new book
    book = Book.new(title: title, price: price, author: author, category: category)
    book.save
  end

  def edit
    # Fetch ALL the books from Active Record
    # Display all books
    books = Book.all
    @view.display(books)
    # Ask for which book by ID
    id = @view.ask_for("ID").to_i
    # Find the book
    # Book.find()
    book = Book.find(id)

    # Ask for title => View
    # Ask for price
    # Ask for author
    # Ask for category
    new_title = @view.ask_for("title")
    new_price = @view.ask_for("price").to_i
    new_author = @view.ask_for("author")
    new_category = @view.ask_for("category")

    book.title = new_title
    book.price = new_price
    book.author = new_author
    book.category = new_category

    book.save
    # Edit the data
    # Save the new witrh new data

  end

  def delete
    # Fetch ALL the books from Active Record
    # Display all books
    books = Book.all
    @view.display(books)
    # Ask for which book by ID
    id = @view.ask_for("ID").to_i

    # Find the book
    book = Book.find(id)
    # Detroy the book
    book.destroy
  end

  def mark_as_rent
    # Fetch ALL the books from Active Record
    # Display all books
    books = Book.all
    @view.display(books)
    # Ask for which book by ID
    id = @view.ask_for("ID").to_i
    # Find the book
    book = Book.find(id)
    # Mark as rent
    ## shorter version: book.rent = !book.rent
    if book.rent # => true
      book.rent = false
    else
      book.rent = true
    end
    # Save
    book.save
  end
end
