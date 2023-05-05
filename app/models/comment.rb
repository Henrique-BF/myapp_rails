class Comment < ApplicationRecord
  belongs_to :article

  validates :title, presence: true
  validates :body, length: { maximum: 100 }, allow_blank: true
end
