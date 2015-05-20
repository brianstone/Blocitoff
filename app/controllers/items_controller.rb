class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @new_item = current_user.items.build(item_params)
    if @new_item.save
      redirect_to authenticated_root_path, notice: "Task successfully added."
    else
      flash[:error] = "Error adding task. Please try again."
      render 'users/show'
    end
  end


  private

  def item_params
    params.require(:item).permit(:task)
  end
end