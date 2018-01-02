class Game < ApplicationRecord
  belongs_to :stadium
  
  
  def self.today
    d = DateTime.now
    current_day = d.strftime("%m/%d/%y")
    Game.all
  end
  
  
end
