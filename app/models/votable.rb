class Votable < ActiveRecord::Base
  validates :name, presence: true
  validates :image_url, presence: true, uniqueness: { case_sensitive: false }

  attr_accessible :name, :description, :image_url

  def to_s
    name
  end
end
