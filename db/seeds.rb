require 'random_data'

 # Create Posts
 50.times do
 # #1
   Post.create!(
 # #2
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all
 
  50.times do
 # #1
   Question.create!(
 # #2
     title: RandomData.random_sentence,
     body:  RandomData.random_paragraph << "?"
   )
 end
 question = Question.all
 
 
 # Create Comments
 # #3
 100.times do
   Comment.create!(
 # #4
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end
 
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 puts "#{Question.count} questions created"