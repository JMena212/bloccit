require 'rails_helper'
include RandomData

RSpec.describe QuestionController, type: :controller do
let(:question) do
     question.create(
       id: 1,
       title: RandomData.random_sentence,
       body:  RandomData.random_paragraph,
       resolved: false
        )
     end
  
  describe "GET #index" do
     it "returns http success" do
       get :index
       expect(response).to have_http_status(:success)
     end
     
     it "assigns [question] to @question" do
       get :index
       expect(assigns(:question)).to eq([my_question])
   end
 end

describe "DELETE destroy" do
     it "deletes the question" do
       delete :destroy, {id: my_question.id}
 # #6
       count = question.where({id: my_question.id}).size
       expect(count).to eq 0
     end
 
     it "redirects to questions index" do
       delete :destroy, {id: my_question.id}
 # #7
       expect(response).to redirect_to question_path
     end
   end


  describe "GET #show" do
     it "returns http success" do
       get :show, {id: my_question.id}
       expect(response).to have_http_status(:success)
     end
     
     it "renders the #show view" do
       get :show, {id: my_question.id}
       expect(response).to render_template :show
     end
     
     it "assigns my_question to @question"do
       get :show, {id: my_question.id}
       expect(assigns(:question)).to eq(my_question)
     end
   end
   
   
     describe "GET edit" do
     it "returns http success" do
       get :edit, {id: my_question.id}
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #edit view" do
       get :edit, {id: my_question.id}
 # #1
       expect(response).to render_template :edit
     end
 
 # #2
     it "assigns question to be updated to @question" do
       get :edit, {id: my_question.id}
 
       question_instance = assigns(:question)
 
       expect(question_instance.id).to eq my_question.id
       expect(question_instance.title).to eq my_question.title
       expect(question_instance.body).to eq my_question.body
     end
   end
   
     describe "PUT update" do
     it "updates question with expected attributes" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph
 
       put :update, id: my_question.id, question: {title: new_title, body: new_body}
 
 # #3
       updated_question = assigns(:question)
       expect(updated_question.id).to eq my_question.id
       expect(updated_question.title).to eq new_title
       expect(updated_question.body).to eq new_body
     end
 
     it "redirects to the updated question" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph
 
 # #4
       put :update, id: my_question.id, question: {title: new_title, body: new_body}
       expect(response).to redirect_to my_question
     end
   end
   
 end
  

