class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @items = current_user.items.all
    @item = current_user.items.build(item_params)
    @new_item = Item.new
    if @item.save
      flash[:notice] = "Task added."
    else
      flash[:error] = "Error adding task."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      flash[:notice] = "Task completed."
    else
      flash[:error] = "Error completing task."     
    end

    respond_to do |format|
      format.html
      format.js
    end
  end



  private

  def item_params
    params.require(:item).permit(:task)
  end
end