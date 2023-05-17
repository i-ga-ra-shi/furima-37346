class ItemsController < ApplicationController
  def index
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_registration_path
    end
  end

  def create
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
