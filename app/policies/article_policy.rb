class ArticlePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.adm? || user.super_adm?
  end

  def update?
    user.adm? || user.super_adm?
  end

  def destroy?
    user.super_adm?
  end
end