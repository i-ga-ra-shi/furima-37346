class PurchasesController < ApplicationController
    def index
        @item = Item.find(params[:item_id])
        @purchase_address = PurchaseAddress.new
    end

    def create
        @purchase_address = PurchaseAddress.new(purchase_params)
        if @purchase_address.valid?
            pay_item
            @purchase_address.save
            redirect_to root_path
        else
            @item = Item.find(params[:item_id])
            render :index
        end
    end


    private

    def purchase_params
        params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def pay_item
        item = Item.find(params[:item_id])
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
            amount: item.price,
            card: purchase_params[:token],
            currency: 'jpy'
        )
    end
end
