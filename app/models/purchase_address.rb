class PurchaseAddress
    include ActiveModel::Model
    attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building, :phone_numver
  
    with_options presence: true do
      validates :user_id, :item_id, :city, :address, :phone_numver
      validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    end
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

    def save
        purchase = Purchase.create(user_id: user_id, item_id: item_id)
        Address.create(post_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
    end
  end