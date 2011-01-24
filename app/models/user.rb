class User < ActiveRecord::Base
  has_many :punches
  has_many :periods, :through => :punches
  
  validates_presence_of :fname, :lname
  
end
