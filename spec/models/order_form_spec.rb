require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入機能' do
    context '商品購入ができる場合' do
      it '全ての項目が正しく入力されていれば購入できる' do
        expect(@order_form).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @order_form.building = ''
        expect(@order_form).to be_valid
      end
    end

    context '購入できない場合' do
      it 'postal_codeが空では購入できない' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank",
                                                            'Postal code is invalid.Enter it as follows (e.g. 123-4567)')
      end
      it 'postal_codeにハイフンがないと購入できない' do
        @order_form.postal_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postal code is invalid.Enter it as follows (e.g. 123-4567)')
      end
      it 'prefecture_idが「---」では購入できない' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では購入できない' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it 'streetが空では購入できない' do
        @order_form.street = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Street can't be blank")
      end
      it 'phoneが空では購入できない' do
        @order_form.phone = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが10桁未満では購入できない' do
        @order_form.phone = '12345678'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone is too short')
      end
      it 'phoneにハイフンが含まれると購入できない' do
        @order_form.phone = '090-1234-1234'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone is invalid.Input only number.(半角数字のみ)')
      end
      it 'phoneが半角数字でなければ購入できない' do
        @order_form.phone = '１２３４５６７８９１２'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone is invalid.Input only number.(半角数字のみ)')
      end
      it 'tokenが空では購入できない' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では購入できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
