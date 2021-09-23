require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録ができるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、kana_last_nameとkana_first_name、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationは半角英数字を混合して6文字以上入力すれば登録できる' do
        @user.password = '111aaa'
        @user.password_confirmation = '111aaa'
        expect(@user).to be_valid
      end
    end
    context '新規登録ができないとき' do
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailは重複していたら登録できない' do
        @user.save
        second_user = FactoryBot.build(:user)
        second_user.email = @user.email
        second_user.valid?
        expect(second_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれていなければ登録できない' do
        @user.email = 'abcabc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordは6文字以上でなければ登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは数字だけでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordは英字だけでは入力できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = '123abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameは全角でないと登録できない' do
        @user.last_name = 'ｲﾁﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_nameは全角でないと登録できない' do
        @user.first_name = 'ｽｽﾞｷ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'kana_last_nameが空では登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end
      it 'kana_first_nameが空では登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end
      it 'kana_last_nameは全角でないと入力できない' do
        @user.kana_last_name = 'ｲﾁﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name is invalid')
      end
      it 'kana_first_nameは全角でないと入力できない' do
        @user.kana_first_name = 'ｽｽﾞｷ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name is invalid')
      end
      it 'kana_last_nameはカナでないと入力できない' do
        @user.kana_last_name = 'いちろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name is invalid')
      end
      it 'kana_first_nameはカナでないと入力できない' do
        @user.kana_first_name = 'すずき'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name is invalid')
      end
      it 'birthdayが空では入力できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
