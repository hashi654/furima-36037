class OrdersController < ApplicationController
  def index
    @order_management = OrderManagement.new
  end

  def create
    @order_management = OrderManagement.new(order_params)
    if @order_management.valid?
      @order_management.save
      redirect_to root_path
    else
      render :index
    end
  end

  private 
  def order_params
    params.require(order_management).permit(:postal_code, :prefecture, :municipality, :address, :building, :telephone_number).merge(user_id: current_user.id, item_id: item_id)
  end
end
