class Tag < ActiveRecord::Base
  attr_accessible :nome


  has_many :taggings
  has_many :articles, :through => :taggings

  def to_s
    nome
  end
end
