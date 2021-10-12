class Order < ApplicationRecord
  belongs_to :management

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
