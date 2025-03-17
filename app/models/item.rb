class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shipping_fee
  belongs_to :shipping_day

  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :name, :description, :price, :image, presence: true
  validates :category_id, :condition_id, :prefecture_id, :shipping_fee_id, :shipping_day_id, presence: true, numericality: {other_than: 1, message: "can't be blank" }
  validate :price_range_and_format

  private

  def price_range_and_format
    if price.present?
      unless price.to_s.match?(/\A[0-9]+\z/)
        errors.add(:price, "半角数字で入力してください")
      end
      unless price.between?(300, 9_999_999)
        errors.add(:price, "¥300〜¥9,999,999の範囲で入力してください（半角数字のみ）")
      end
    end
  end
end



