class OrderManagement
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :municipality, :address, :building, :telephone_number, :management_id, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format:{with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :address
    validates :telephone_number, format: { with: /\A\d{10,11}\z/ }
    validates :management_id
    validates :user_id
    validates :item_id
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

  def save
    management = Management.create(user_id: current_user.id, item_id: item_id)
    Order.create(postal_code: postal_code, prefecture: prefecture, municipality: municipality, address: address, building: building, telephone_number: telephone_number, management_id: management.id) 
  end
end