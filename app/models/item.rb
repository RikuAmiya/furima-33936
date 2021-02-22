class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to       :category
  belongs_to       :status
  belongs_to       :shopping_cost
  belongs_to       :area
  belongs_to       :shopping_day
  
  belongs_to       :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :text
    validates :image
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shopping_cost_id
    validates :area_id
    validates :shopping_day_id
  end

  validates :price,
  :numericality => {
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9999999,
    message: '入力値が300~9999999の範囲外です' 
  }
end
