module LaconicaHelper
  def self.id_of_issue(issue)
    if issue.nil?
      return nil
    else
      # id= issue.id
      # paddingLength= 3 - (id.to_s.length)
      # if paddingLength > 0
      #   paddingLength.times { id= "0" + id.to_s }
      # end
      return issue.id.to_s
    end
  end
end
