class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new
    @advertisements = Advertisement.new
  end

  def create
     @advertisements = Advertisement.new
     @advertisements.title = params[:advertisement][:title]
     @advertisements.body = params[:advertisement][:body]

 # #10
     if @advertisements.save
 # #11
       flash[:notice] = "advertisement was saved successfully."
       redirect_to @advertisements
     else
 # #12
       flash.now[:alert] = "There was an error saving the advertisement. Please try again."
       render :new
     end
  end
end
    
