# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root to: 'root#index'

  get 'about-us', to: 'about#index', as: :about

  # Users
  get 'login', to: 'users#login'
  get 'signup', to: 'users#signup'
  get 'logout', to: 'users#logout'
  get 'profile', to: 'users#profile'

  # Articles
  # resources :articles
  get 'articles', to: 'articles#index', as: :articles
  get 'articles/new', to: 'articles#new', as: :articles_new
  post 'articles/new', to: 'articles#create'
  get 'articles/:id', to: 'articles#view', as: :articles_view
  get 'articles/:id/edit', to: 'articles#edit', as: :articles_edit
  patch 'articles/:id/edit', to: 'articles#update'
  delete 'articles/:id', to: 'articles#delete', as: :articles_delete
end
