class QuestionController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @questions = Question.new
    @questions.title = params[:question][:title]
    @questions.body = params[:question][:body]
     if @questions.save
         flash[:notice] = "question was saved successfully."
        redirect_to @questions
     else
       flash.now[:alert] = "There was an error saving the question. Please try again."
        render :new
     end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.title = params[:question][:title]
    @question.body = params[:question][:body]
 
     if @question.save
       flash[:notice] = "Question was updated successfully."
       redirect_to @question
     else
       flash.now[:alert] = "There was an error saving the question. Please try again."
       render :edit
     end
  end

  def destroy
    @question = Question.find(params[:id])

     if @question.destroy
       flash[:notice] = "\"#{@question.title}\" was deleted successfully."
       redirect_to question_path
     else
       flash.now[:alert] = "There was an error deleting the question."
       render :show
     end
  end

end 

