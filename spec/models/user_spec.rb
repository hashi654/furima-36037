require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    context '新規登録ができるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、kana_last_nameとkana_first_name、birthdayが存在すれば登録できる' do
      end
      it 'passwordとpassword_confirmationは半角英数字を混合して6文字以上入力すれば登録できる' do
      end
    end
    context "新規登録ができないとき" do
      it 'emailが空では登録できない' do
      end
      it 'emailは重複していたら登録できない' do
      end
      it 'emailに@が含まれていなければ登録できない' do
      end
      it 'passwordが空では登録できない' do
      end
      it 'passwordは6文字以上でなければ登録できない' do
      end
      it 'passwordは数字だけでは登録できない' do
      end
      it 'passwordは英字だけでは入力できない' do
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
      end
      it 'last_nameが空では登録できない' do
      end
      it 'first_nameが空では登録できない' do
      end
      it 'last_nameは全角でないと登録できない' do
      end
      it 'first_nameは全角でないと登録できない' do
      end
      it 'kana_last_nameが空では登録できない' do
      end
      it 'kana_first_nameが空では登録できない' do
      end
      it 'kana_last_nameは全角でないと入力できない' do
      end
      it 'kana_first_nameは全角でないと入力できない' do
      end
      it 'birthdayが空では入力できない' do
      end
    end
  end

  describe 'トップページの表示' do
    context 'ログインしているとき' do
      it 'トップページのヘッダーに「nickname」と「ログアウト」ボタンが表示されていること' do
      end
      it 'トップページのヘッダーの「ログアウト」ボタンをクリックするとログアウトができること' do
      end
    end
    context 'ログインしていないとき' do
      it 'トップページのヘッダーに「新規登録」と「ログイン」ボタンが表示されていること' do
      end
      it 'トップページのヘッダーの「新規登録」ボタンをクリックすると新規登録ページに遷移できる' do
      end
      it 'トップページのヘッダーの「ログイン」ボタンをクリックするとログインページに遷移できること' do
      end
    end
  end
end
