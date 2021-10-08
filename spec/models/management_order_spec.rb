require 'rails_helper'

RSpec.describe ManagementOrder, type: :model do
  describe 'ユーザー新規登録' do
    before do
      user = FactoryBot.build(:user)
      @management_order = FactoryBot.build(:management_order, user_id: user.id)
  end

  context '正しく入力できている場合' do
    it '全ての値が正しく入力されていれば保存できること' do
    end
    it 'buildingは空でも保存できること' do
    end
  end

  context '正しく入力できていない場合' do
    it 'postal_codeが空だと購入できないこと' do 
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと購入できないこと' do
    end
    it 'prefectureを選択していないと購入できないこと' do
    end
    it 'prefectureが1だと購入できないこと' do 
    end
    it 'municipalityが空だと購入できないこと' do
    end
    it 'addressが空だと購入できないこと' do
    end
    it 'telephone_numberが空だと購入できないこと' do
    end
    it 'telephone_number数字でなければ購入できないこと' do
    end
    it 'telephone_numberは11桁か12桁でなければ購入できないこと' do
    end
    it 'userが紐づいていないと購入できないこと' do
    end
    it 'itemが紐づいていないと購入できないこと' do
    end
  end
end
