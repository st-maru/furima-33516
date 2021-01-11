require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end

  describe '商品購入' do
    context '保存できる場合' do
      it '郵便番号・都道府県・市区町村・番地・建物名・電話番号・トークンがあれば保存できる' do
        expect(@user_order).to be_valid
      end
      it '建物名が空でも保存できる' do
        @user_order.building_name = ""
        expect(@user_order).to be_valid
      end
    end

    context '保存できない場合' do
      it '郵便番号が空では保存できない' do
        @user_order.post_code = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にハイフンが含まれていない場合保存できない' do
        @user_order.post_code = "1234567"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Post code Input correctly")
      end
      it '都道府県が選択されていない場合保存できない' do
        @user_order.prefecture_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture Select")
      end
      it '市区町村が空では保存できない' do
        @user_order.city = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では保存できない' do
        @user_order.house_number = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空では保存できない' do
        @user_order.phone_number = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンが含まれている場合保存できない' do
        @user_order.phone_number = "090-1111-1111"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number Input only number")
      end
      it '電話番号が11桁以上の場合保存できない' do
        @user_order.phone_number = "123456789012"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it 'トークンが空では保存できない' do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end