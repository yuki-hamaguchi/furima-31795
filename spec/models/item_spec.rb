require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品ができる時' do
      it "image,item_name,info,category_id,sales_status_id,shipping_fee_status_id,prefecture_id,scheduled_delivery_id,priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
    context '商品出品ができない時' do
      it "imageが空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "item_nameが空だと出品できない" do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "infoが空だと出品できない" do
        @item.info = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it "category_idが空だと出品できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it "sales_status_idが空だと出品できない" do
        @item.sales_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status must be other than 0")
      end
      it "shipping_fee_status_idが空だと出品できない" do
        @item.shipping_fee_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status must be other than 0")
      end
      it "prefecture_idが空だと出品できない" do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it "scheduled_delivery_idが空だと出品できない" do
        @item.scheduled_delivery_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 0")
      end
      it "priceが空だと出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが300以下では出品できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが9999999以上では出品できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end
      it "priceが半角数字以外は登録できない" do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "userが紐付いていないと出品できないこと" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
