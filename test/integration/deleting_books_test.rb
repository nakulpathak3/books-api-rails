require 'test_helper'

class DeletingBooksTest < ActionDispatch::IntegrationTest

  setup do
    @book = Book.create!(title: 'Harry Potter', rating: 5)
  end

  test "delete books" do
    delete "/api/books/#{@book.id}"

    assert_equal 204, response.status # No body needs to be sent

  end
end
