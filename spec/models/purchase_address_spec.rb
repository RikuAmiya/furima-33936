require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    context '商品購入できるとき' do
      it 'postal_code、area_id、city、address、phone_num,tokenが存在すれば登録できる' do
        expect(@purchase_address).to be_valid
      end
      it 'buildingが空でも登録できる' do
        @purchase_address.building = nil
        expect(@purchase_address).to be_valid
      end
    end
    context '商品購入できないとき' do
      it 'postal_codeが空では登録できない' do
        @purchase_address.postal_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal codeが入力されていません。')
      end
      it 'postal_codeにハイフンがないと保存できないこと' do
        @purchase_address.postal_code = '8620908'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal codeハイフン(-)を含んで入力してください。')
      end
      it 'area_idが1では登録できない' do
        @purchase_address.area_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Areaは1以外の値にしてください")
      end
      it 'cityが空では登録できない' do
        @purchase_address.city = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Cityが入力されていません。")
      end
      it 'addressが空では登録できない' do
        @purchase_address.address = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Addressが入力されていません。")
      end
      it 'phone_numが空では登録できない' do
        @purchase_address.phone_num = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone numが入力されていません。")
      end
      it 'phone_numが11行以内でないと保存できないこと' do
        @purchase_address.phone_num = '08008080808080'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone numの設定が範囲外です')
      end

      it 'phone_numが英数混合では登録できないこと' do
        @purchase_address.phone_num = '0800mmmm'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone numは半角数字を用いて入力してください。')
      end

      it 'tokenが空では登録できないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tokenが入力されていません。")
      end
      it 'user_idが空では登録できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Userが入力されていません。")
      end
      it 'item_idが空では登録できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Itemが入力されていません。")
      end
    end
  end
end