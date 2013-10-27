class MatchesController < ApplicationController

  skip_before_filter :verify_authenticity_token

  # renders latest matches
  def index
    @matches = Match.order('created_at DESC').all
  end

  # renders form
  def new
  end

  # handles new match processing
  def create

    @error = ""

    match_data = {}

    [:orange_offense_player_id,
     :orange_defense_player_id,
     :white_offense_player_id,
     :white_defense_player_id].each do |given_player|

      if params[given_player].blank?
        @error = "Please fill out all fields."
      end

      player = Player.where({:name => params[given_player]}).first

      if player.nil?
        player = Player.create!({:name => params[given_player]})
      end

      match_data[given_player] = player.id ;

    end

    if params[:white_score].blank? or params[:orange_score].blank?
      @error = "Please fill out all fields."
    end

    match_data[:white_score] = params[:white_score]
    match_data[:orange_score] = params[:orange_score]

    if params[:white_score] < params[:orange_score]
      match_data[:white_won] = 1
      match_data[:orange_won] = 0
    else
      match_data[:orange_won] = 1
      match_data[:white_won] = 0
    end

    match_data[:created_by_ip] = request.remote_ip

    if @error != ""
      render "new"
    else
      Match.create!(match_data)
      redirect_to(:root)
    end

  end

end
