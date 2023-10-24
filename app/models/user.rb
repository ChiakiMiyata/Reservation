class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :recoverable, and :omniauthable
  has_one_attached :avatar
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :romms, dependent: :destroy
  has_many :reservations, dependent: :destroy

end
