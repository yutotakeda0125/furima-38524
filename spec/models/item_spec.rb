require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品の出品ができる場合' do
      it "全ての必須項目が登録できている" do
        expect(@item).to be_valid
      end
    end
    context '商品の出品ができない場合' do
      it "userが紐付いていなければ出品できない" do
        @item.user=nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it "imageが空では保存できない" do
        @item.image =nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空では保存できない"do
         @item.name =''
         @item.valid?
         expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "descriptionが空では保存できない" do
        @item.description =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "category_idが未選択では保存できない" do
        @item.category_id =0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "status_idが未選択では保存できない" do
        @item.status_id =0
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "shipping_cost_idが未選択では保存できない" do
        @item.shipping_cost_id =0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end
      it "shipping_date_idが未選択では保存できない" do
        @item.shipping_date_id =0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end
      it "prefecture_idが未選択では保存できない" do
        @item.prefecture_id =0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "priceが空では保存できない" do
        @item.price =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが全角数字では保存できない" do
        @item.price ="６００００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが300より小さいと保存できない" do
        @item.price ="200"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが9999999より超えると保存できない" do
        @item.price ="10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
