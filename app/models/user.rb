class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :followers, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followeds, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  attachment :profile_image

  def followed_by?(user)
    followeds.where(follower_id: user.id).exists?
  end

  def follows_by?(user)
    followers.where(follower_id: user.id).exists?
  end

  def followers_by?(user)
    followeds.where(followed_id: user.id).exists?
  end

  validates :name, uniqueness: true, length: {minimum: 2, maximum: 20}
  validates :introduction, length: {maximum: 50}

end
