Rails.application.routes.draw do

  use_doorkeeper
  namespace :api do
    resources :books
    resources :finished_books
    resources :genres
  end

end
