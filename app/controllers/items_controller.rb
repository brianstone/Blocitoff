class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @new_item = current_user.items.build(item_params)
    if @new_item.save
      redirect_to authenticated_root_path, notice: "Task added."
    else
      flash[:error] = "Error adding task."
      render 'users/show'
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