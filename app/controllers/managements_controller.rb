class ManagementsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  def index
    @management_order = ManagementOrder.new
    @item = Item.find(params[:item_id])
  end

  def create
    @management_order = ManagementOrder.new(management_params)
    if @management_order.valid?
      @management_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def management_params
    params.require(:management_order).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
