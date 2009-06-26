# Empty redmine plguin
require 'redmine'

# TODO: Change this to use the name of your plugin
RAILS_DEFAULT_LOGGER.info 'Starting laconi.ca plugin for RedMine'

# TODO: Change the name 
Redmine::Plugin.register :empty_plugin do
  name 'laconi.ca plugin'
  author 'Ciaran Jessup'
  description 'This plugins integrates redmine with an existing laconi.ca installation'
  version '0.0.1'
end
