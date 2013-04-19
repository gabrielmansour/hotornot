# A.K.A. Candidate
class Votable < ActiveRecord::Base
  validates :name, presence: true
  validates :image_url, presence: true, uniqueness: { case_sensitive: false }

  attr_accessible :name, :description, :image_url

  has_reputation :votes, source: :user, aggregated_by: :sum

  def self.not_voted_on_by(user)
    joins("INNER JOIN rs_evaluations ON votables.id = rs_evaluations.target_id AND
           rs_evaluations.target_type = 'Votable' AND
           rs_evaluations.reputation_name = 'votes' AND
           rs_evaluations.source_type = 'User'").where(["rs_evaluations.source_id != ?", user.id])
    scoped
  end

  def to_s
    name
  end
end
