require 'test_helper'

class CreatingBooksTest < ActionDispatch::IntegrationTest

  test 'creates new books' do
    post '/books', { book: {
        title: 'Pragmatic Programmer',
        rating: 5
      } }.to_json,
      { 'Accept' => 'application/json', 'Content-Type' => 'application/json'}

    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type

    book = json(response.body)
    assert_equal response.location, book_url(book[:id])
    assert_equal 'Pragmatic Programmer', book[:title]
    assert_equal 5, book[:rating].to_i

  end
end
