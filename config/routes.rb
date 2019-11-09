Rails.application.routes.draw do
  resources :users
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'login', to: 'sessions#new', as: :login
  get 'logout', to: 'sessions#destroy', as: :logout
  post 'sessions', to: 'sessions#create', as: :session
  root 'posts#index'
end
