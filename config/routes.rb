Rails.application.routes.draw do
  # resources :users, only: [:new, :create]
  root 'sessions#welcome'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'

  # resources :likes
  resources :movies
  get 'search', to: 'movies#search'
  resources :reviews
  # resources :users
  get "/users", to: 'users#index', as: "users" # index
  get '/users/new', to: 'users#new', as: 'new_user' #new
  post '/users', to: 'users#create' #create
  get "/users/:id", to: "users#show", as: "user" #show
  get "/users/:id/edit", to: 'users#edit', as: "edit_user" #edit
  patch "/users/:id", to: 'users#update' #update
  delete "/users/:id", to: 'users#destroy' #destroy
  post '/logout', to: 'users#logout'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
