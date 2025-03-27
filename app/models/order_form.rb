class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street, :building, :phone, :user_id, :item_id, :token, :price 

  with_options presence: true do
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank" }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid.Enter it as follows (e.g. 123-4567)" }
    validates :phone, length: {in: 10..11, message: "is too short" },
                      format: {with: /\A\d+\z/, message: "is invalid.Input only number.(半角数字のみ)"}
    validates :user_id
    validates :token
    validates :city
    validates :street
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(
      postal_code: postal_code, 
      prefecture_id: prefecture_id, 
      city: city, 
      street: street, 
      building: building,
      phone: phone,
      order_id: order.id
    )  
  end

end
  