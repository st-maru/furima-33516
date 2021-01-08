require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  before do
    @buyer_address = FactoryBot.build(:buyer_address)
  end

  describe '商品購入' do
    context '保存できる場合' do
      it '' do
        expect(@item).to be_valid
      end
    end

    context '保存できない場合' do
      it '' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      
    end
  end
end