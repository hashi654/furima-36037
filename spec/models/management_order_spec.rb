require 'rails_helper'

RSpec.describe ManagementOrder, type: :model do
  describe 'ユーザー新規登録' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @management_order = FactoryBot.build(:management_order, user_id: user.id, item_id: item.id)
      sleep 0.5
    end
    context '正しく入力できている場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@management_order).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @management_order.building = ''
        expect(@management_order).to be_valid
      end
    end
    context '正しく入力できていない場合' do
      it 'postal_codeが空だと購入できないこと' do 
        @management_order.postal_code = ''
        @management_order.valid?
        expect(@management_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと購入できないこと' do
        @management_order.postal_code = '1234567'
        @management_order.valid?
        expect(@management_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefectureを選択していないと購入できないこと' do
        @management_order.prefecture_id = ''
        @management_order.valid?
        expect(@management_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefectureが1だと購入できないこと' do 
        @management_order.prefecture_id = 1
        @management_order.valid?
        expect(@management_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空だと購入できないこと' do
        @management_order.municipality = ''
        @management_order.valid?
        expect(@management_order.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと購入できないこと' do
        @management_order.address = ''
        @management_order.valid?
        expect(@management_order.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空だと購入できないこと' do
        @management_order.telephone_number = ''
        @management_order.valid?
        expect(@management_order.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberは数字でなければ購入できないこと' do
        @management_order.telephone_number = '電話番号'
        @management_order.valid?
        expect(@management_order.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberは11桁か12桁でなければ購入できないこと' do
        @management_order.telephone_number = '12345678'
        @management_order.valid?
        expect(@management_order.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'userが紐づいていないと購入できないこと' do
        @management_order.user_id = nil
        @management_order.valid?
        expect(@management_order.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと購入できないこと' do
        @management_order.item_id = nil
        @management_order.valid?
        expect(@management_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
