class Article < ApplicationRecord
  has_many :comments
  belongs_to :user, optional: true

  validates :title, presence: true
  validate :check_body_max_length

  MAX_ADM_BODY_LENGTH = 100
  MAX_SUBSCRIBED_USER_BODY_LENGTH = 20
  MAX_DEFAULT_BODY_LENGTH = 10

  private

  def check_body_max_length
    return if body.blank? || body.length <= body_max_length

    errors.add :body, "Body max length is #{body_max_length}"
  end

  def body_max_length
    return MAX_DEFAULT_BODY_LENGTH unless user
    return MAX_ADM_BODY_LENGTH if user.adm? || user.super_adm?
    user.subscribed_at? ? MAX_SUBSCRIBED_USER_BODY_LENGTH : MAX_DEFAULT_BODY_LENGTH
  end
end
