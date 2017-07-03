class CartsController < ApplicationController
	def show
		# binding.pry
	end

	def checkout
		cart = Cart.find(params[:id])
		# binding.pry
		cart.place_order
		current_user.current_cart = nil
		current_user.save

		flash[:notice] = "Thanks for your purchase"
		redirect_to cart_path(cart)
	end
end
