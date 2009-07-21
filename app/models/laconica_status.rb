class LaconicaStatus
  def self.send_update(msg)
    url = "#{self.api_address}/statuses/update.xml?status=" + CGI::escape(msg)
    debugger
    post_to_server(url)
  end
  
  # def self.search(query, options={})
  #   url = "#{self.api_address}/search.json?q=" + CGI::escape(query)
  # 
  #   if is_twitter_api
  #     url=url.sub("twitter.com","search.twitter.com")
  #   end
  #     
  #   if options[:results_per_page]
  #     url= url +"&rpp=" + options[:results_per_page].to_s
  #   end
  #   response= post_to_server(url)
  #   return ActiveSupport::JSON::decode(response.body.content)
  # end

  def self.find_by_issue(issue, options={})
    if is_twitter_api
      # Need to re-implement this.
    else 
      url = "#{self.api_address}/laconica/tags/timeline/#{issue.id}.json"
      if options[:results_per_page]
        url= url +"?count=" + options[:results_per_page].to_s
      end
      response= post_to_server(url)
      return ActiveSupport::JSON::decode(response.body.content)
    end
  end
private
  def self.api_address()
    server_url= server_address
    unless is_twitter_api
      server_url= server_url + "/api"
    end
    return server_url
  end

  def self.server_address()
    return Setting.plugin_laconica_plugin[:server_url]
  end

  def self.post_to_server(url) 
    client = HTTPClient.new
    client.debug_dev = STDOUT if $DEBUG
    client.set_auth(url, Setting.plugin_laconica_plugin[:server_username], Setting.plugin_laconica_plugin[:server_password])
    resp = client.post(url)
    return resp
  end
  
  def self.is_twitter_api()
    return server_address =~ /twitter/
  end
end