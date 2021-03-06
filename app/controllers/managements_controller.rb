class ManagementsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  def index
    @management_order = ManagementOrder.new
    @item = Item.find(params[:item_id])
    redirect_to root_path unless @item.management.nil?
    redirect_to root_path if current_user.id == @item.user_id
  end

  def create
    @management_order = ManagementOrder.new(management_params)
    if @management_order.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: Item.find(params[:item_id]).price,
        card: management_params[:token],
        currency: 'jpy'
      )
      @management_order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def management_params
    params.require(:management_order).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :telephone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end
end
