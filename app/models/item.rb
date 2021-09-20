class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id, presence: true
  validates :cost_id, presence: true
  validates :prefecture_id, presence: true
  validates :days_id, presence: true
  validates :image, presence: true

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :cost
  belongs_to :prefecture
  belongs_to :days
end
