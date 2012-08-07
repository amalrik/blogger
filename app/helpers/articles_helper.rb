module ArticlesHelper
  def tag_links(tags)
    links = tags.collect{|tag| link_to tag.nome, tag_path(tag)}
    return links.join(", ").html_safe
  end
end
