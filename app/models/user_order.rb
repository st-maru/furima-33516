class UserOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :order_id, :token, :price

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "Input correctly" }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :house_number
    validates :phone_number,length: { maximum: 11 }, format: { with: /\A[0-9]+\z/, message: "Input only number" }
    validates :token
  end

    def save
      order = Order.create(user_id: user_id, item_id: item_id)
      BuyerAddress.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
    end
end 