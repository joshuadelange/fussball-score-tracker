class PlayersController < ApplicationController

  def index
    @players = Player.all()
    @players.sort! { |p1, p2| p2.score <=> p1.score }
  end

  def show
    @player = Player.find(request[:id])
  end

end
