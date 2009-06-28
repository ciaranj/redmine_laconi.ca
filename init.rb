require 'redmine'

RAILS_DEFAULT_LOGGER.info 'Starting laconi.ca plugin for RedMine'

require_dependency 'laconica_issue_change_listener'
require_dependency 'laconica_issue_show_hooks'

Redmine::Plugin.register :laconica_plugin do
  name 'laconi.ca plugin'
  author 'Ciaran Jessup'
  description 'This plugins integrates redmine with an existing laconi.ca installation'
  version '0.0.1'
  
  settings :default => {'server_url' => 'http://identi.ca/', 'server_username' => '', 'server_password'=>''}, :partial => 'settings/laconica_settings'
end
