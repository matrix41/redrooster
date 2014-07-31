Rails.application.routes.draw do
  # show all the reviews 
  get '/reviews' => 'reviews#index'
  # form for a new review 
  get '/new' => 'reviews#new'
  # post form here 
  post '/create' => 'reviews#create'
end
