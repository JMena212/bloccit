require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do

   let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }
 # #13
   let(:my_post) { my_topic.sponsored_post.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }

end
