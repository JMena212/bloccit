Rails.application.routes.draw do
    resources :labels, only: [:show]


 #1  we call the resources method and pass it a Symbol. 
 #This instructs Rails to create post routes for creating, updating, viewing, and deleting instances of Post. 
 #We'll review the precise URIs created in a moment.
    resources :topics do
 # #34
     resources :posts, except: [:index]
   end

   get 'about' => 'welcome#about'
   
   resources :users, only: [:new, :create, :show]
   
   resources :sessions, only: [:new, :create, :destroy]
   
   root 'welcome#index'
   
   
 # #19
   namespace :api do
     namespace :v1 do
       resources :users, only: [:index, :show]
       resources :topics, only: [:index, :show]
     end
   end
   
 # #4
   resources :posts, only: [] do
 # #5
   resources :comments, only: [:create, :destroy]
   resources :favorites, only: [:create, :destroy]
   
   post '/up-vote' => 'votes#up_vote', as: :up_vote
   post '/down-vote' => 'votes#down_vote', as: :down_vote
   
   end

end

