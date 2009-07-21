class LaconicaIssueShowHooks < Redmine::Hook::ViewListener
  include ActionView::Helpers::DateHelper
  
  def view_layouts_base_html_head(context = {})
    return stylesheet_link_tag("laconica.css", :plugin => "redmine_laconi.ca")
  end        
  
  def view_issues_show_description_bottom(context = {})

    if context[:issue]
      @issue = context[:issue]
      html=""
      html+= '<hr />'
      html+= '<div class="contextual">'
#      html+= '<a class="icon icon-comment" href="#">Quote</a>'
      html+= '</div>'

      html+="<p><strong>#{l(:laconica_issue_updates)}</strong></p>"
      
      search_results= LaconicaStatus.find_by_issue(@issue, {:results_per_page=>5})
      html+="<ul class='statuses'>"
      unless search_results.nil?
        search_results.each do |result|
          html+= issue_helper( result )
        end
      end
      html+="</ul>"
      return html
    end
  end
private
  def issue_helper(issue) 
    user= issue['user']
    html=""
    html+=<<EOS
<li class='status'>
  <span class="entry-content" >
    <img class='avatar' style='vertical-align:top;' width='36' height='36' alt='#{user['name']}' title= '#{user['name']}' src='#{user['profile_image_url']}'/>
    <span class="entry-details">
      <span class='status_text'>#{issue['text']}</span><br/>
      <span class='status_time'>#{l(:laconica_issue_published)} <abbr class='published' title='#{issue['created_at']}'>#{our_time_ago_in_words(issue['created_at'])}</abbr> by #{issue['from_user']} </span>
    </span>
  </span>
</li>
EOS
    return html  
  end
  
  def our_time_ago_in_words(time)
    return time_ago_in_words(time) + ' ago' 
  end
end