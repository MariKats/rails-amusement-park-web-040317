class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.happiness > self.nausea
      "happy"
    else
      "sad"
    end 
  end



end

# has a method 'mood' that returns 'sad' when the user is more nauseous than happy (FAILED - 43)
#   has a method 'mood' that returns 'happy' when the user is more happy than nauseous (FAILED - 44)
