class Punch < ActiveRecord::Base
  belongs_to :user
  belongs_to :period
  
  validates_presence_of :user_id, :period_id, :ptime, :ptype
  validates_uniqueness_of :ptime
  validate :proper_type?
private

 def proper_type?
   unless ptype =~ /I|O|N|X/
     errors.add(:ptype, "is not a valid punch type (I,O,N,X)")
   end
 end
  
end
