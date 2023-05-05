class ArticlePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    return user.id == record.user_id if user.customer? && !user.subscribed?
    true
  end

  def destroy?
    user.super_adm?
  end
end