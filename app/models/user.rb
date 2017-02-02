# coding: utf-8
class User < ActiveRecord::Base
  before_save { self.email = self.email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :hometown, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  has_secure_password
  has_many :microposts,
           dependent: :destroy
  has_many :following_relationships, class_name:  "Relationship", foreign_key: "follower_id", dependent:   :destroy
  has_many :following_users, through: :following_relationships, source: :followed
  has_many :follower_relationships, class_name:  "Relationship",
           foreign_key: "followed_id",
           dependent:   :destroy
  has_many :follower_users, through: :follower_relationships, source: :follower
  #original------->
  has_many :favorites,
           # foreign_key: "liking_id",
           dependent: :destroy
  # has_many :microposts, through: :favorites
  # has_many :favoritepost_relationships,
  #          class_name:  "Favorite",
  #          foreign_key: "liking_id",
  #          dependent:   :destroy
  # has_many :favorite_microposts, through: :favoritepost_relationships, source: :liking
  # #favoritedっているかな?
  # has_many :favorited_relationships,
  #          class_name: "Favorite",
  #          foreign_key: "favorite_usr",
  #          dependent: :destory
  # has_many :favorited_users, through: :favorited_relationships, source: :favorite_pos
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
  #---->
  # 他のユーザーをフォローする
  def follow(other_user)
    following_relationships.find_or_create_by(followed_id: other_user.id)
  end

  # フォローしているユーザーをアンフォローする
  def unfollow(other_user)
    following_relationship = following_relationships.find_by(followed_id: other_user.id)
    following_relationship.destroy if following_relationship
  end

  # あるユーザーをフォローしているかどうか？
  def following?(other_user)
    following_users.include?(other_user)
  end

  def feed_items
    Micropost.where(user_id: following_user_ids + [self.id])
  end
end
