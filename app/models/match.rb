class Match < ActiveRecord::Base

  def orange_offense_player
    Player.find_by_id(self.orange_offense_player_id)
  end

  def orange_defense_player
    Player.find_by_id(self.orange_defense_player_id)
  end

  def white_offense_player
    Player.find_by_id(self.white_offense_player_id)
  end

  def white_defense_player
    Player.find_by_id(self.white_defense_player_id)
  end

end
