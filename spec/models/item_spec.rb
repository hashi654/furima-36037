require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
    context '商品出品ができるとき' do
      it 'imageとitem_name,explanation,category_id,status_id,cost_id,prefecture_id,days_id,priceが入力されていれば登録できる'
    end
    context '商品出品ができないとき' do
      it 'imageが空では出品できない' do
      end
      it 'item_nameが空では出品できない' do
      end
      it 'explanationが空では出品できない' do
      end
      it 'category_idが空では出品できない' do
      end
      it 'category_idが"1"では出品できない' do
      end
      it 'status_idが空では出品できない' do
      end
      it 'status_idが"1"では出品できない' do
      end
      it 'cost_idが空では出品できない' do
      end
      it 'cost_idが"1"では出品できない' do
      end
      it 'prefecture_idが空では出品できない' do
      end
      it 'prefecture_idが"1"では出品できない' do
      end
      it 'days_idが空では出品できない' do
      end
      it 'days_idが"1"では出品できない' do
      end
      it 'priceが空では出品できない' do
      end
      it 'priceが300未満では出品できない' do
      end
      it 'priceが9999999では出品できない' do
      end
    end
  end
end
