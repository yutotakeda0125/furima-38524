class ItemsController < ApplicationController

   def index
    
   end

   def new
   @item = Item.new
   end
   
   def create
     @item=Item.new(item_params)
     if @item.save
      redirect_to root_path
     else
      render :new
     end
   end
  
   def set_item
    @item = Item.find(params[:id])
   end
   
   def move_to_index
    redirect_to root_path unless current_user == @item.user
  end
  
end
