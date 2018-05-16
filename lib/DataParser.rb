require_relative "../config/environment.rb"
require 'aslsx'

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

  def calculate_k_pct(player)
    return (((player['stats']['PitcherStrikeouts']['#text'].to_f)/(player['stats']['TotalBattersFaced']['#text'].to_f))*100).round(1).to_s
  end

  def calculate_bb_pct(player)
    return (((player['stats']['PitcherWalks']['#text'].to_f)/(player['stats']['TotalBattersFaced']['#text'].to_f))*100).round(1).to_s
  end

  def calculate_gb_pct(player)
    return (((player['stats']['PitcherGroundBalls']['#text'].to_f)/(player['stats']['PitchesThrown']['#text'].to_f))*100).round(1).to_s
  end

  def calculate_fb_pct(player)
    return (((player['stats']['PitcherFlyBalls']['#text'].to_f)/(player['stats']['PitchesThrown']['#text'].to_f))*100).round(1).to_s
  end

  def get_era(player)
    return player['stats']['EarnedRunAvg']['#text']
  end

  def calculate_swstr_pct(player)
    return (((player['stats']['PitcherStrikesMiss']['#text'].to_f)/(player['stats']['PitchesThrown']['#text'].to_f))*100).round(1).to_s
  end

  def output_data

  end
end