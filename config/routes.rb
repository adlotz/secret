Rails.application.routes.draw do
  get 'users/home'

  get 'users/secret'
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
