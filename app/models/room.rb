class Room < ApplicationRecord
  belongs_to :user
  has_one_attached :room_image
  validates :room_name, :introduction, :address, presence: true
  validates :fee, numericality: true, presence: true
  has_many :reservations

  def self.search(search)
    return Room.all unless search
    Room.where('address LIKE(?)', "%#{search}%")
  end
end
