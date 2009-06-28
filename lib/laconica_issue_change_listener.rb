require 'rubygems'  
require 'httpclient'  

class LaconicaIssueChangeListener < Redmine::Hook::Listener
  def controller_issues_edit_after_save(context={})
    if context[:issue] 
      id= LaconicaHelper::id_of_issue(context[:issue])
      LaconicaStatus.send_update("@#{User.current.login} just updated issue #{id}")
    end
  end
end
