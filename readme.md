# Reading List API

A RESTful API for managing a reading list.

## Routes

### GET Requests

* `/books` for list of books
* `/books/:id` for specific book

### POST Requests

* `/books/new` for creating a new book. Parameters required - 'Title', 'Author'. Optional - 'Description', 'Amazon' (Refers to Amazon ID of book).

### PUT Requests

* `/books/edit/:id` for editing books. Parameters required - 'Title', 'Author'. Optional - 'Description', 'Amazon' (Refers to Amazon ID of book).