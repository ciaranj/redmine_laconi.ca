require 'rubygems'  
require 'httpclient'  

class LaconicaIssueChangeListener < Redmine::Hook::Listener
  def controller_issues_edit_after_save(context={})
    if context[:issue] 
      id= context[:issue].id
      paddingLength= 3 - (id.to_s.length)
      if paddingLength > 0
        paddingLength.times { id= "0" + id.to_s }
      end
      LaconicaStatus.send_update("@#{User.current.login} just updated issue ##{id}")
    end
  end
end
