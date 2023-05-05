class Article < ApplicationRecord
  has_many :comments

  validates :title, presence: true
  validates :body, length: { maximum: 100 }, allow_blank: true
end
