class UsersController < ApplicationController

  def show
    @new_item = Item.new
  end
end
