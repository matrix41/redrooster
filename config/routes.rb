Rails.application.routes.draw do
  root to: 'restaurants#index' # show list of ALL restaurants
  # show all the reviews 
  get '/reviews' => 'reviews#index'

  resources :restaurnts
  get 'restaurant/:id' => 'restaurants#show'

  # form for a new restaurnt
  get '/addnewrestaurant' => 'restaurants#new'

  post '/createnewrestaurant' => 'restaurants#create'

  # form for a new review 
# get '/new' => 'reviews#new'
  get '/new:id' => 'reviews#new'

  # post form here 
  post '/create' => 'reviews#create'

end
