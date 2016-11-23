class Api::V1::PostsController < Api::V1::BaseController
 # #22
   before_action :authenticate_user, except: [:index, :show]
   before_action :authorize_user, except: [:index, :show]
   
    
    
   def create
     topic = Topic.find(params[:topic_id])
     post = topic.posts.build(post_params)
     post.user = @current_user
     
     if post.valid?
        render json: post, status: 201 
     else
       render json: {error: "Post is invalid", status: 400}, status: 400
     end
   end
    
 private
   def post_params
     params.require(:post).permit(:title, :body)
   end
    
end