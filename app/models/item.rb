class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :sales_status, :shipping_fee_status, :prefecture, :scheduled_delivery
  belongs_to :user
  #has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :item_name,              length: { maximum: 40 }
    validates :info,                   length: { maximum: 1000 }
      with_options numericality: { other_than: 0 } do
        validates :category_id
        validates :sales_status_id
        validates :shipping_fee_status_id
        validates :prefecture_id
        validates :scheduled_delivery_id
      end
    validates :price, format: { with: /\A[0-9]+\z/}, numericality: { greater_than_or_equal_to: 300, less_than: 9999999 }
    validates :user
  end
end
