# coding: utf-8
class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  # has_many :favoriteuser_relationships,
  #          class_name:  "Favorite",
  #          foreign_key: "liked_id",
  #          dependent:   :destroy
  # has_many :favorite_users, through: :favorite_relationships, source: :liked
  has_many :favorites,
           # foreign_key: "liked_id",
           dependent: :destroy
  def favorited_by? user
    favorites.where(user_id: user.id).exists?
  end
  # has_many :users, through: :favorites
  # #original--->
  # has_many :favorite_relationships,
  #          class_name:  "Favorite",
  #          foreign_key: "liking_id",
  #          dependent:   :destroy
  # has_many :favorite_users, through: :favorite_relationships, source: :liking
  # # #favoritedっているかな?
  # # has_many :favorited_relationships,
  # #          class_name: "Favorite",
  # #          foreign_key: "favorite_usr",
  # #          dependent: :destory
  # # has_many :favorited_users, through: :favorited_relationships, source: :favorite_pos
  # def favorite(other_user)
  #   favorite_relationships.find_or_create_by(liking_id: other_user.id)
  # end

  # def unfavorite(other_user)
  #   favorite_relationship = favorite_relationships.find_by(liking_id: other_user.id)
  #   favorite_relationship.destroy if favorite_relationship
  # end

  # def favorite?(other_user)
  #   favorite_users.include?(other_user)
  # end
  # #---->
end
