class Donation < ApplicationRecord
  belongs_to :donor

  def has_memo?
    !memo.blank?
  end
end
