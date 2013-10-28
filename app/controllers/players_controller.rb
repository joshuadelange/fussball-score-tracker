class PlayersController < ApplicationController

  def index

    unless request[:q].blank?
      @players = Player.where("LOWER(name) like LOWER(?)", "%#{request[:q]}%")
      render :json => @players
    else
      @players = Player.all()
      @players.sort! { |p1, p2| p2.score <=> p1.score }
    end

  end

  def show
    @player = Player.find(request[:id])
  end

end
