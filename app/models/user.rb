class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, presence: true
  validates :photo_url, presence: true, format: { with: %r{\Ahttps?://.*\z}, message: 'must be a valid URL' }
  validates :bio, length: { maximum: 500 }

  def three_most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
