class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new(purchase_params)
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
   else
     render action: :index
   end
  end

  private
  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :area_id, :city, :address, :building, :phone_num, :token).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
