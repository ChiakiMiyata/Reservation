class Reservation < ApplicationRecord
  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :people, presence: true,numericality: {greater_than_or_equal_to: 1}
  validate :start_end_check
  validate :past_check

  belongs_to :room
  belongs_to :user

  def start_end_check
    if (check_in.present? && check_out.present?)
      errors.add(:check_out, "はチェックインより後の日付を選択してください") unless
      check_in < check_out
    end
  end

  def past_check
    if check_in < Date.today
    errors.add(:check_in, '本日以降の日付を選択してください')
    end
  end
end