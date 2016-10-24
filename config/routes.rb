Rails.application.routes.draw do
  root 'welcome#index'

  resources :labels, only: [:show]

  resources :topics do
    resources :posts, except: [:index]
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy], module: :posts
  end

  resources :topics, only: [] do
    resources :comments, only: [:create, :destroy], module: :topics
  end

  get 'about', to: 'welcome#about'
end
