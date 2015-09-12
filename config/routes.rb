Rails.application.routes.draw do
  root 'yarns#index'

  # resources :users
  resources :yarns

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
end
