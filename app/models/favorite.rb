class Favorite < ActiveRecord::Base
  belongs_to :user# , foreign_key: "liking_id"  # :linking, class_name: "Micropost"
  belongs_to :micropost# , foreign_key: "liked_id"
  # belongs_to :unfavorite, class_name: "Micropost"
  validates :user, presence: true
  validates :user_id, uniqueness: { scope: :micropost_id }
  validates :micropost, presence: true
end
