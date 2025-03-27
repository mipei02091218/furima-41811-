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
  validates :category_id, :condition_id, :prefecture_id, :shipping_fee_id, :shipping_day_id, presence: true,
                                                                                             numericality: { other_than: 1, message: "can't be blank" }
  validates :price, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999,
    message: '¥300〜¥9,999,999の範囲で入力してください（半角数字のみ）'
  }
end
