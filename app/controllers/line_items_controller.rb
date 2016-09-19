class LineItemsController < ApplicationController
  def create
    current_user.create_cart if !current_user.current_cart
    items = current_user.current_cart.add_item(params[:item_id])
    if items.save
      redirect_to cart_path(current_user.current_cart), notice: "Item added to cart"
    else
      redirect_to store_path, notice: "Unable to add item"
    end
  end
end
