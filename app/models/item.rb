class Item < ApplicationRecord

  belongs_to :user
  #has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :item_name 
    validates :info
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id 
    validates :prefecture_id
    validates :scheduled_delivery_id
    validates :prise
    validates :user
  end
end
