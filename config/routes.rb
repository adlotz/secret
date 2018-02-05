Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  get '/secret', to: 'static_pages#secret'


  get '/signup',  to: 'users#new'
  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
