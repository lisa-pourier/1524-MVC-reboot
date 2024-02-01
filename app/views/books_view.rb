class BooksView
  def display(books)
    books.each do |book|
      status = book.rent ? "Unavailable" : "Available" # rent is actually rented

      puts "\nID:#{book.id} - TITLE:#{book.title}"

      puts "Status: #{status}"
    end

  end

  def ask_for(thing)
    puts "what is #{thing}?"
    gets.chomp
  end

end
