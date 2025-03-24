class OrdersController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_form_params)
    if @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_form_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :street, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: Item.find(params[:item_id]).price)
  end
  
  def pay_item
    Payjp.api_key = "sk_test_7386c4cbe7d9a0f019cd3fb6"
    Payjp::Charge.create(
      amount: order_form_params[:price],
      card: order_form_params[:token],
      currency: 'jpy'
      )
  end

end
