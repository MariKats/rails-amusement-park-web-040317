Rails.application.routes.draw do

resources :users
resources :attractions
resources :rides
root 'welcome#index'
get '/signup', to: 'users#new', as: 'signup'
get '/signin', to: 'sessions#new', as: 'signin'
post '/sessions', to: 'sessions#create', as: 'sessions'
get '/logout', to: 'sessions#destroy', as: 'logout'

end
