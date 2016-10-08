class TopicsController < ApplicationController
 # #7
   before_action :require_sign_in, except: [:index, :show]
 # #8
    
    def index
        @topics = Topic.all
        authorize!(@topics)
    end
    
    def new
      @topic = Topic.new
        authorize!(@topic)
    end
    
    def create
      @topic = Topic.new(topic_params)
      authorize!(@topics)
      
      if @topic.save
       flash[:notice] = "Topic was saved successfully."
       redirect_to @topic
      else
       flash.now[:alert] = "Error creating topic. Please try again."
       render :new
      end
    end
    
    def show
      @topic = Topic.find(params[:id])
      authorize!(@topic)
    end
    
    def update
      @topic = Topic.find(params[:id])
      @topic.assign_attributes(topic_params)
      authorize!(@topic)
 
      if @topic.save
        flash[:notice] = "Topic was updated successfully."
        redirect_to @topic
      else
        flash.now[:alert] = "Error saving topic. Please try again."
        render :edit
      end
    end

    
    def edit 
        @topic = Topic.find(params[:id])
        authorize!(@topic)
    end
    
    def destroy
        @topic = Topic.find(params[:id])
        authorize!(@topic)
 
     if @topic.destroy
        flash[:notice] = "\"#{@topic.name}\" was deleted successfully."
        redirect_to action: :index
     else
        flash.now[:alert] = "There was an error deleting the topic."
        render :show
     end
    end
 
   private
 
   def topic_params
     params.require(:topic).permit(:name, :description, :public)
   end
   
 # #9
  # def authorize_admin
   #  unless current_user.admin? 
    #   flash[:alert] = "You must be an admin to do that."
     #  redirect_to topics_path
     #end
   #end
   
   def authorize!(collection)
     case action_name
     when 'index', 'show'
         collection
     when 'edit', 'update'
         unless current_user.admin? || current_user.moderator?
         redirect_to topics_path, alert: 'You are not authorized to do that'
         end
     when 'new', 'create', 'destroy'
         unless current_user.admin?
         redirect_to topics_path, alert: 'You are not authorized to do that'
         end
     end
   
   end
end
