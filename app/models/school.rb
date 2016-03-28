class School < ActiveRecord::Base
  has_many :activities
  validates_presence_of :name
  
  def admission 
    if self.students < 5000
      "Accepted"
    else
      "Denied"
    end   
  end 

end
