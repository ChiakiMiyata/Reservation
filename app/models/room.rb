class Room < ApplicationRecord
  belongs_to :user
  has_one_attached :room_image
  validates :room_name, :introduction, :address, presence: true
  validates :fee, numericality: true, presence: true
end
