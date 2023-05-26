class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :day_for_send

  validates :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :day_for_send_id,
            numericality: { other_than: 1, message: "can't be blank" }
  validates :name, :explanation, :price, :image, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
