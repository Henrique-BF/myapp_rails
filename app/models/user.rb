class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  has_many :articles

  def subscribed?
    subscribed_at != nil
  end

  def customer?
    role == "customer"
  end

  def adm?
    role == "adm"
  end

  def super_adm?
    role == "super_adm"
  end
end
