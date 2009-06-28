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
      
      search_results= LaconicaStatus.search("issue "+ LaconicaHelper::id_of_issue(@issue), {:results_per_page=>5})
      
      unless search_results.nil?
        search_results["results"].each do |result|
          html+='<div class="wiki">'
          html+="<p><img src='" +result['profile_image_url']+"'/> #{result['text']}</p>"
          html+='</div>'
        end
      end
      return html
    end
  end
end
