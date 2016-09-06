class PostsController < ApplicationController
  def index
   # #11
     @posts = Post.all
  end

  def show
   # #19
     @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
  end
  
   def create
 # #9
     @post = Post.new
     @post.title = params[:post][:title]
     @post.body = params[:post][:body]

 # #10
     if @post.save
 # #11
       flash[:notice] = "Post was saved successfully."
       redirect_to @post
     else
 # #12
       flash.now[:alert] = "There was an error saving the post. Please try again."
       render :new
     end
   end
end