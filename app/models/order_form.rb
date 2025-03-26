class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street, :building, :phone, :user_id, :item_id, :token, :price 

  with_options presence: true do
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank" }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid" }
    validates :phone, format: {with: /\A[0-9\-]+\z/, message: "is invalid."}
    validates :user_id
    validates :token
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
  