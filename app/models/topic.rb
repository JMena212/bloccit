class Topic < ActiveRecord::Base
   has_many :posts, dependent: :destroy
 # #12
   has_many :labelings, as: :labelable
 # #13
   has_many :labels, through: :labelings
   ##Checkpoint 46 Private Topics
   scope :visible_to, -> (user) { user ? all : publically_viewable }
   scope :publically_viewable, -> { where(public: true) }
   scope :privately_viewable, -> { where(public: false) }
end
