class LaconicaIssueShowHooks < Redmine::Hook::ViewListener
  def view_issues_show_description_bottom(context = {})

    if context[:issue]
      @issue = context[:issue]
      html=""
      html+= '<hr />'
      html+= '<div class="contextual">'
#      html+= '<a class="icon icon-comment" href="#">Quote</a>'
      html+= '</div>'

      html+="<p><strong>#{l(:laconica_issue_updates)}</strong></p>"
      html+='<div class="wiki">'
      html+='<p>asdasd</p>'
      html+='</div>'
      
      
      
    
#      html = '<div class="box" id="statuses">'
#      html += '<h3 class="icon22 icon22-users">Developer Status</h3>'

#       Status.recent_updates_for(@project, 5).each do |status|
#         html += <<EOHTML
#           <div>
#             <dl>            
#               <dt class="status_user">#{ avatar(status.user) }#{h status.user.name}</dt>
#               <dd class="status_message">
#                 <span class="time">#{format_time(status.created_at, true)}:</span>
#                 <p>#{format_status_message(status)}</p>
#               </dd>
#             </dl>
#           </div>
#           <div style="clear:both;"></div>
# EOHTML
#       end
#      html += link_to("View all statuses", :controller => 'statuses', :action => 'index', :id => @project)
#      html += '</div>'

      return html
    end
  end

end
