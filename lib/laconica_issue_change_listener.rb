require 'rubygems'  
require 'httpclient'  

class LaconicaIssueChangeListener < Redmine::Hook::Listener
  def controller_issues_edit_after_save(context={})
    if context[:issue] 
      id= context[:issue].id
      LaconicaStatus.send_update("@#{User.current.login} just updated ##{id}")
    end
  end
end
