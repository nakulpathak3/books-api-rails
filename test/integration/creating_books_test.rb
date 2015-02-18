require 'test_helper'

class CreatingBooksTest < ActionDispatch::IntegrationTest

  test 'creates new books with valid data' do
    post '/books', { book: {
        title: 'Harry Potter',
        rating: 5,
        author: 'J.K Rowling',
        genre_id: 1,
        review: "Crazy crazy book love it.",
        amazon_id: '2324'
      } }.to_json,
      { 'Accept' => 'application/json', 'Content-Type' => 'application/json'}

    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type

    book = json(response.body)[:book]
    assert_equal response.location, book_url(book[:id])
    assert_equal 'J.K Rowling', book[:author]
    assert_equal 1, book[:genre_id]
    assert_equal "2324", book[:amazon_id]
    assert_equal "Crazy crazy book love it.", book[:review]
    assert_equal 'Harry Potter', book[:title]
    assert_equal 5, book[:rating].to_i

  end

  test 'does not create books with invalid data' do
    post '/books', { book: {
        title: nil,
        rating: 5
      } }.to_json,
      { 'Accept' => 'application/json', 'Content-Type' => 'application/json'}

      assert_equal 422, response.status
  end
end
