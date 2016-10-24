class Topic < ActiveRecord::Base
   has_many :posts, dependent: :destroy
   has_many :comments, as: :commentable
 # #12
   has_many :labelings, as: :labelable
 # #13
   has_many :labels, through: :labelings
end
