require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品ができる時' do
      it "必須情報が存在すれば登録できること" do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない時' do
      it 'nameが空では登録できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Nameが入力されていません。")
      end

      it 'imageが空では登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Imageが入力されていません。")
      end
  
      it 'textが空では登録できないこと' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Textが入力されていません。")
      end
  
      it 'priceが空では登録できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceが入力されていません。")
      end
  
      it 'categoryが1では登録できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Categoryは1以外の値にしてください")
      end
  
      it 'statusが1では登録できないこと' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Statusは1以外の値にしてください")
      end
  
      it 'shopping_cost_idが1では登録できないこと' do
        @item.shopping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping costは1以外の値にしてください")
      end
  
      it 'shopping_day_idが1では登録できないこと' do
        @item.shopping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping dayは1以外の値にしてください")
      end
  
      it 'areaが1では登録できないこと' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Areaは1以外の値にしてください")
      end
   
      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
  
      it 'priceが300未満では登録できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price入力値が300~9999999の範囲外です")
      end
  
      it 'priceが10,000,000以上では登録できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price入力値が300~9999999の範囲外です")
      end
  
      it '全角文字では登録できないこと' do
        @item.price = 'ああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price入力値が300~9999999の範囲外です")
      end
  
      it '半角英数混合では登録できないこと' do
        @item.price = '111aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price入力値が300~9999999の範囲外です")
      end
  
      it '半角英語だけでは登録できないこと' do
        @item.price = 'aaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price入力値が300~9999999の範囲外です")
      end
    end
  end
end