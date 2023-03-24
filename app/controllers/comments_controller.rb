class CommentsController < ApplicationController
  before_action:set_item
  
  def create
    @item = Item.find(params[:item_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      CommentChannel.broadcast_to @item, { comment: @comment, user: @comment.user } #追加
      redirect_to item_path(params[:item_id])
    else
      @item = @comment.item
      @comments = @item.comments
      render "items/show" 
    end

  end

  def destory
    @comment = Comment.find(params[:item_id])
    if @comment.use_id==current_user.id&&@comment.destory
      redirect_to item_path(params[:item_id])
    else
      render "items/show" 
    end
  end

    
  private
  
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  def set_item
    @item = Item.find(params[:item_id])
  end
end

