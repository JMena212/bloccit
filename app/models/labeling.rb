 class Labeling < ActiveRecord::Base
 # #7
   belongs_to :labelable, polymorphic: true
 end