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

    return players
  end

end