class LaconicaStatus
  def self.send_update(msg)
    url = "#{self.api_address}/statuses/update.xml?status=" + CGI::escape(msg)
    post_to_server(url)
  end
  
  def self.search(query)
    url = "#{self.api_address}/search.json?q=" + CGI::escape(query)
    post_to_server(url)
  end

private
  def self.api_address()
    server_url= Setting.plugin_laconica_plugin[:server_url]
    server_url= server_url + "/api" unless server_url=~/twitter/
    return server_url
  end

  def self.post_to_server(url) 
    client = HTTPClient.new
    client.debug_dev = STDOUT if $DEBUG
    client.set_auth(url, Setting.plugin_laconica_plugin[:server_username], Setting.plugin_laconica_plugin[:server_password])
    resp = client.post(url)
    return resp
  end
end