class Article < ActiveRecord::Base
  attr_accessible :title, :body, :tag_list, :image

  has_many :comments
  has_many :taggings
  has_many :tags, :through => :taggings
  has_attached_file :image  

  def tag_list
    return self.tags.join(", ")
  end

  def tag_list=(tags_string)
    self.taggings.destroy_all
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq

    tag_names.each do |tag_name|
      tag = Tag.find_or_create_by_nome(tag_name)
      tagging = self.taggings.new
      tagging.tag_id = tag.id
    end
  end

  def increment_count_view
    if self.view_count
      self.view_count += 1
    else
      self.view_count = 1
    end
  end

  def self.top_3
    Article.order('view_count DESC limit 3')
  end

end
