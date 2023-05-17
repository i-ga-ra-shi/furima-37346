class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    binding.pry
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  
  private
  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :day_for_send_id, :price, :image).merge(user_id: current_user.id)
  end
end
