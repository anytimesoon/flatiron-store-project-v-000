class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  helper_method :current_cart

  def current_cart
    # binding.pry
    if current_user
      if current_user.current_cart 
        # binding.pry
        current_user.current_cart
      elsif current_user.carts.last && current_user.carts.last.status == "submitted"
        # binding.pry
        current_user.current_cart = nil
      else
        # binding.pry
        cart = current_user.carts.build
        current_user.current_cart = cart
        current_user.save
        cart
      end
    end
  end

  def remove_item_from_inventory(cart)
    cart.items.each do |item|
      item.inventory -= 1 unless item.inventory == 0
    end
  end
end
