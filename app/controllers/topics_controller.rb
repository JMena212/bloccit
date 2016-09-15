class TopicsController < ApplicationController
    def index
        @topics = Topic.all
    end
    
    def new
        @topic = Topic.new
    end  
    
    def show
     @topic = Topic.find(params[:id])
    end
end
