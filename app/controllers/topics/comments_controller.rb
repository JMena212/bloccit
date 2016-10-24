class Topics::CommentsController < ApplicationController
 # #10
   before_action :require_sign_in
   before_action :authorize_user, only: [:destroy]

   def create
     @topic = Topic.find(params[:topic_id])
     comment = @topic.comments.new(comment_params)
     comment.user = current_user

     if comment.save
       flash[:notice] = "Comment saved successfully."
     else
       flash[:alert] = "Comment failed to save."
     end
     redirect_to @topic
   end

   def destroy
     @topic = Topic.find(params[:topic_id])
     comment = @topic.comments.find(params[:id])

     if comment.destroy
       flash[:notice] = "Comment was deleted successfully."
     else
       flash[:alert] = "Comment couldn't be deleted. Try again."
     end
     redirect_to @topic
   end

   private

 # #14
   def comment_params
     params.require(:comment).permit(:body)
   end


 # #16
   def authorize_user
     comment = Comment.find(params[:id])
     unless current_user == comment.user || current_user.admin?
       flash[:alert] = "You do not have permission to delete a comment."
       redirect_to [comment.post.topic, comment.post]
     end
   end

end
