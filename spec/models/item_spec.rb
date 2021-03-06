require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '保存できる場合' do
      it '画像、商品名と商品説明、カテゴリー、商品の状態、配送料の負担、
          発送元の地域、発送までの日数、価格が存在すれば保存できる' do
        expect(@item).to be_valid
      end
    end

    context '保存できない場合' do
      it '画像が空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空では保存できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'カテゴリーが選択されていない場合保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it '商品の状態が選択されていない場合保存できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status Select')
      end
      it '配送料の負担が選択されていない場合保存できない' do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Fee Select')
      end
      it '発送元の地域が選択されていない場合保存できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture Select')
      end
      it '発送までの日数が選択されていない場合保存できない' do
        @item.duration_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Duration Select')
      end
      it '価格が299円以下の場合保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it '価格が10000000円以上の場合保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it '価格が全角文字の場合保存できない' do
        @item.price = 'てすと'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
      it '価格が半角英数混合の場合保存できない' do
        @item.price = '1000aa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
      it '価格が半角英語の場合保存できない' do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
    end
  end
end
