class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(option, search)
    if option == "perfect_match"
      Book.where("title LIKE?", "#{search}")
    elsif option == "forward_match"
      Book.where("title LIKE?", "#{search}%")
    elsif option == "backward_match"
      Book.where("title LIKE?", "%#{search}")
    elsif option == "partial_match"
      Book.where("title LIKE?", "%#{search}%")
    else
      Book.all
    end
  end


  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 200}

end
