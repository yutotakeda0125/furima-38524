class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item, only: [:edit,:show,:update]
  before_action :move_to_index, only: [:edit, :update]
  
   def index
    @items=Item.includes(:user).order("created_at DESC")
   end
   
   def new
   @item = Item.new
   end
   
   def create
    @item = Item.new(item_params)
     if @item.save
      redirect_to root_path
     else
      render :new
     end
   end


    def edit
      @item = Item.find(params[:id])
    end
   
    def update
      @item = Item.find(params[:id])
     if @item.update(item_params)
      redirect_to item_path(@item.id)
     else
      render :edit
     end
    end
    
    def show
      @item = Item.find(params[:id])
    end
  
  
  private

  def item_params
    params.require(:item).permit(:name,:description,:category_id,:status_id,:shipping_cost_id,:shipping_date_id,:prefecture_id,:price,:image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless current_user.id == @item.user_id
  end

end
