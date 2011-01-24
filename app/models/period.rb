class Period < ActiveRecord::Base
  has_many :punches
  has_many :users, :through => :punches
  
  validates_presence_of :starting, :ending
  validates_uniqueness_of :ending
  validate :proper_order?
private

 def proper_order?
   if ending <= starting
    errors.add(:ending, "is not after starting date of period")
  end
 end
end
