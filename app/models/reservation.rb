class Reservation < ApplicationRecord
  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :people, presence: true,numericality: true
  validate :start_end_check

  belongs_to :room
  belongs_to :user

  def start_end_check
    if (self.check_in != nil && self.check_out != nil)
      errors.add(:check_out, "はチェックインより後の日付を選択してください") unless
      self.check_in < self.check_out
    end
  end
end