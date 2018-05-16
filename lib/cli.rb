require_relative "../config/environment.rb"
require 'axlsx'

class CLI

  def get_players
    puts ">> Enter a player's name and press <ENTER>"
    puts ">> When you are done entering players, type <DONE>"

    players = Array.new

    input = gets.chomp.downcase

    until input == 'done'
      players << input
      input = gets.chomp.downcase
    end

    return players.join(",")
  end

  def start
    puts "Welcome to MLB Player Stats"
    player_list = get_players
  
    player_data = DataRetriever.new.get_player_data(player_list)

    players_hash = DataParser.new.create_players_hash(player_data)

    # call method to export data from players_hash to excel sheet
    puts "Your player stats have been exported to <filename>."
    puts "Have a nice day!"
  end

end