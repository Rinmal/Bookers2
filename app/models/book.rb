class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 200}

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.looks(method, word)
    if method == 'perfect_match'
      @book = self.where("title LIKE? or body LIKE?","#{word}", "#{word}")
    elsif method == 'forward_match'
      @book = self.where("title LIKE? or body LIKE?","#{word}%", "#{word}%")
    elsif method == 'behind_match'
      @book = self.where("title LIKE? or body LIKE?","%#{word}", "#{word}%")
    elsif method == 'part_match'
      @book = self.where("title LIKE? or body LIKE?","%#{word}%", "#{word}%")
    end
  end
end
