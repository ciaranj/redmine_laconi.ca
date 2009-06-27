require 'rubygems'  
require 'httpclient'  

class LaconicaIssueChangeListener < Redmine::Hook::Listener
  def controller_issues_edit_after_save(context={})
      status_msg="@#{User.current.login} just updated issue  ##{context[:issue].id}"
      
      server_url= Setting.plugin_laconica_plugin[:server_url]
      server_url= server_url + "/api" unless server_url=~/twitter/
      url = "#{server_url}/statuses/update.xml?status=" + CGI::escape(status_msg)

      client = HTTPClient.new
      client.debug_dev = STDOUT if $DEBUG
      client.set_auth(url, Setting.plugin_laconica_plugin[:server_username], Setting.plugin_laconica_plugin[:server_password])
      resp = client.post(url)
  end
end
