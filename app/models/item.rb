class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to       :user
  has_one_attached :image
  
  belongs_to       :category
  belongs_to       :status
  belongs_to       :shopping_cost
  belongs_to       :area
  belongs_to       :shopping_day
end
