class CartsController < ApplicationController

  def show
    @current_cart = current_user.current_cart
  end

  def checkout
    @current_cart = Cart.find(params[:id])
    if @current_cart.checkout
      current_user.remove_cart
    end
    redirect_to cart_path(@current_cart)
  end
end
