class Player < ActiveRecord::Base

  has_many :match

  def score

    score = 0

    matches = Match.where("
      (
        orange_won = 1 
        AND (
              orange_offense_player_id = #{self.id}
          OR  orange_defense_player_id = #{self.id}
        )
      )
      OR
      (
        white_won = 1 
        AND (
              white_offense_player_id = #{self.id}
          OR  white_defense_player_id = #{self.id}
        )
      )
    ")

    matches.each do |match|
      if match.orange_won
        score = score + match.orange_score - match.white_score
      else
        score = score + match.white_score - match.orange_score
      end
    end

    score

  end

  def times_won

    matches = Match.where("
      (
        orange_won = 1 
        AND (
              orange_offense_player_id = #{self.id}
          OR  orange_defense_player_id = #{self.id}
        )
      )
      OR
      (
        white_won = 1 
        AND (
              white_offense_player_id = #{self.id}
          OR  white_defense_player_id = #{self.id}
        )
      )
    ")

    matches.count

  end

  def times_lost

    matches = Match.where("
      (
        orange_won = 0 
        AND (
              orange_offense_player_id = #{self.id}
          OR  orange_defense_player_id = #{self.id}
        )
      )
      OR
      (
        white_won = 0 
        AND (
              white_offense_player_id = #{self.id}
          OR  white_defense_player_id = #{self.id}
        )
      )
    ")

    matches.count

  end

  def matches_played

    fields = [
      :orange_offense_player_id,
      :orange_defense_player_id,
      :white_offense_player_id,
      :white_defense_player_id
    ]

    sql = fields.map { |f| "#{f} = #{self.id}" }.join(" OR ")

    Match.where(sql).count

  end

  def orange_matches_played

    fields = [
      :orange_offense_player_id,
      :orange_defense_player_id,
    ]

    sql = fields.map { |f| "#{f} = #{self.id}" }.join(" OR ")

    Match.where(sql).count

  end

  def white_matches_played

    fields = [
      :white_offense_player_id,
      :white_defense_player_id,
    ]

    sql = fields.map { |f| "#{f} = #{self.id}" }.join(" OR ")

    Match.where(sql).count

  end

  def offense_matches_played

    fields = [
      :white_offense_player_id,
      :orange_offense_player_id,
    ]

    sql = fields.map { |f| "#{f} = #{self.id}" }.join(" OR ")

    Match.where(sql).count

  end

  def defense_matches_played

    fields = [
      :white_defense_player_id,
      :orange_defense_player_id,
    ]

    sql = fields.map { |f| "#{f} = #{self.id}" }.join(" OR ")

    Match.where(sql).count

  end

end
