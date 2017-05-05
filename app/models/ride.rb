class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction


# has a method 'take_ride' that accounts for the user not having enough tickets (FAILED - 43)
# has a method 'take_ride' that accounts for the user not being tall enough (FAILED - 44)
# has a method 'take_ride' that accounts for the user not being tall enough and not having enough tickets (FAILED - 45)
# has a method 'take_ride' that updates ticket number (FAILED - 46)
# has a method 'take_ride' that updates the user's nausea (FAILED - 47)
# has a method 'take_ride' that updates the user's happiness (FAILED - 48)

  def take_ride
    if self.user.tickets < self.attraction.tickets && self.user.height > self.attraction.min_height
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif self.user.height < self.attraction.min_height && self.user.tickets > self.attraction.tickets
      return "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    else
      self.user.tickets = self.user.tickets - self.attraction.tickets
      self.user.nausea = self.user.nausea + self.attraction.nausea_rating
      self.user.happiness = self.user.happiness + self.attraction.happiness_rating
      self.user.save
      return "Thanks for riding the #{attraction.name}!"
    end
  end

end
