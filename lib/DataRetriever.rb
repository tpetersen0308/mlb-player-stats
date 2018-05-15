class DataRetriever

  def get_player_data(player_names)
    for_date = DateTime.now.strftime("%Y%m%d")
    pull_url = "https://api.mysportsfeeds.com/v1.2/pull/mlb/2018-regular/cumulative_player_stats.json?for-date=#{for_date}&player=#{player_names}"
    uri = URI(pull_url)
  
    # Create client
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER
  
    # Create Request
    req =  Net::HTTP::Get.new(uri)
    # Add headers
    req.add_field "Authorization", "Basic " + Base64.encode64("#{ENV['USERNAME']}:#{ENV['PASSWORD']}")
  
    # Fetch Request
    res = http.request(req)

    return JSON.parse(res.body)["cumulativeplayerstats"]["playerstatsentry"]
  end

end