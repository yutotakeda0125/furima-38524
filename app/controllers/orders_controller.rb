class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :no_purchase_item,only: [:index, :create]
  
  def index
    @order_payment=OrderPayment.new
    if @item.order
      redirect_to root_path
    end
  end
  
  
  def create
    @order_payment = OrderPayment.new(order_params) 
    if @order_payment.valid?
      pay_item
      @order_payment.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_payment).permit(:postcode,:prefecture_id,:city,:block,:building,:phone_number).merge(user_id: current_user.id,item_id:params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount:@item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def no_purchase_item
    @item=Item.find(params[:item_id])
    redirect_to root_path if current_user.id==@item.user_id
  end

end
