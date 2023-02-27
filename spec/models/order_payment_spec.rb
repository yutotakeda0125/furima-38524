require 'rails_helper'

RSpec.describe OrderPayment, type: :model do
    before do
      user = FactoryBot.create(:user)
      item =  FactoryBot.create(:item)
      @order_payment=FactoryBot.build(:order_payment,user_id:user.id,item_id:item.id)
    end
    
  describe '配送先情報の保存' do
    context '配送先情報が保存できる場合' do
      it "全ての必須項目が登録できている" do
        expect(@order_payment).to be_valid
      end
      it "building_nameは空でも保存できること" do
        @order_payment.building=nil
        @order_payment.valid?
        expect(@order_payment).to be_valid
      end
    end
    context '配送先情報が保存できない場合' do
      it "user_idが空だと保存できないこと" do
        @order_payment.user_id=nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空だと保存できないこと" do
        @order_payment.item_id=nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Item can't be blank")
      end
      it "postcodeが空だと保存できないこと" do
        @order_payment.postcode=''
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Postcode can't be blank", "Postcode is invalid. Include hyphen(-)")
      end
      it "postcodeがは『3桁ハイフン4桁』半角英数字でないと保存できないこと" do
        @order_payment.postcode = '1231234'
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end
      it "prefecture_idが空だと保存できないこと" do
        @order_payment.prefecture_id = 0
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "cityが空だと保存できないこと" do
        @order_payment.city = ''
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("City can't be blank")
      end
      it "blockが空だと保存できないこと" do
        @order_payment.block = ''
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Block can't be blank")
      end
      it "phone_numberが空だと保存できないこと" do
        @order_payment.phone_number = ''
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it "phone_numberが9桁以下であると購入できないこと" do
        @order_payment.phone_number = '090090090'
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Phone number is invalid")
      end
      it "phone_numberが12桁以上であると保存できないこと" do
        @order_payment.phone_number = '090123456789'
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Phone number is invalid")
      end
      it "phone_numberにハイフンがあると保存できないこと" do
        @order_payment.phone_number = '090-1234-5678'
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Phone number is invalid")
      end
      it "tokenが空では登録できないこと" do
        @order_payment.token = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

