Rails.application.routes.draw do

resources :users
resources :attractions
resources :rides
resources :sessions
root 'welcome#index'
get '/signup', to: 'users#new', as: 'signup'
get '/signin', to: 'sessions#create', as: 'signin'

end
