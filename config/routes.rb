Rails.application.routes.draw do
  get 'question/index'

  get 'question/new'

  get 'question/create'

  get 'question/show'

  get 'question/edit'

  get 'question/update'

  get 'question/destroy'

 #1  we call the resources method and pass it a Symbol. 
 #This instructs Rails to create post routes for creating, updating, viewing, and deleting instances of Post. 
 #We'll review the precise URIs created in a moment.
   resources :posts
   
   resources :question

   get 'about' => 'welcome#about'
   
   root 'welcome#index'

end

