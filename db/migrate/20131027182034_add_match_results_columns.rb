class AddMatchResultsColumns < ActiveRecord::Migration
  def change
    add_column :matches, :white_won, :integer, :null => false
    add_column :matches, :orange_won, :integer, :null => false
  end
end
