class Instrument < ApplicationRecord

  belongs_to :user

  has_one_attached :instrument_pic

  validates :instrument_pic, content_type: { in: %w[image/jpeg image/png] }
  validates :title, :brand, :price, :model, presence: true
  validates :description, length: { maximum: 1000 }
  validates :title, length: { maximum: 140 }
  validates :price, numericality: { only_integer: true }, length: { maximum: 7 }

  BRAND = %w[Fender Gibson Epiphone ESP Martin Dean Taylor Jackson PRS Ibanez Charvel Washburn]
  FINISH = %w[Black White Navy Blue Red Clear Satin Yellow Seafoam]
  CONDITION = %w[New Excellent Mint Used Fair Poor]
  
  def display_thumb
    instrument_pic.variant(resize_to_limit: [400, 300])
  end

  def display_default
    instrument_pic.variant(resize_to_limit: [800, 600])
  end

end
