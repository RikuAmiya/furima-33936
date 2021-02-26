class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code,:area_id, :city, :address, :building, :phone_num, :user_id, :item_id, :token

  with_options presence: true do
    validates :city
    validates :address
    validates :phone_num, format: {with: /\A[0-9]+\z/, message: "は半角数字を用いて入力してください。"}, length: { maximum: 11, message: 'の設定が範囲外です' }
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "ハイフン(-)を含んで入力してください。"}
    validates :token
  end
  validates :area_id, numericality: { other_than: 1 }
  
  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code,  area_id: area_id, city: city, address: address, building: building, phone_num: phone_num, purchase_id: purchase.id)
  end
end