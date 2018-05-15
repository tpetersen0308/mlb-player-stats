class DataParser

  def create_players_hash(player_data)
    players = {}

    player_data.each do |player|
      players["#{player['player']['FirstName']} #{player['player']['LastName']}"] = {
        k_pct: calculate_k_pct(player),
        bb_pct: calculate_bb_pct(player),
        gb_pct: calculate_gb_pct(player),
        fb_pct: calculate_fb_pct(player),
        era: get_era(player),
        swstr_pct: calculate_swstr_pct(player)
      }
    end

    return players
  end
end