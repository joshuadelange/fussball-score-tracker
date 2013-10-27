class BasicDb < ActiveRecord::Migration
  def change
    add_column :matches, :orange_offense_player_id, :integer, :null => false
    add_column :matches, :orange_defense_player_id, :integer, :null => false
    add_column :matches, :white_offense_player_id, :integer, :null => false
    add_column :matches, :white_defense_player_id, :integer, :null => false
    add_column :matches, :orange_score, :integer, :null => false
    add_column :matches, :white_score, :integer, :null => false
    add_column :matches, :created_by_ip, :string, :null => false

    add_column :players, :name, :string, :null => false
  end
end
