Rails.application.routes.draw do
 #1  we call the resources method and pass it a Symbol. 
 #This instructs Rails to create post routes for creating, updating, viewing, and deleting instances of Post. 
 #We'll review the precise URIs created in a moment.
    resources :topics do
 # #34
     resources :posts, except: [:index]
   end

   get 'about' => 'welcome#about'
   
   resources :users, only: [:new, :create]
   
   resources :sessions, only: [:new, :create, :destroy]
   
   root 'welcome#index'

end

