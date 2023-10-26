class Room < ApplicationRecord
  belongs_to :user
  has_one_attached :room_image
  validates :room_name, :introduction, :address, presence: true
  validates :fee, numericality: {greater_than_or_equal_to: 1}, presence: true
  has_many :reservations
end
