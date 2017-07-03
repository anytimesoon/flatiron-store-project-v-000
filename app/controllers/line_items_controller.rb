class LineItemsController < ApplicationController
	def create
		cart = current_cart
		cart.add_item(params[:item_id])
		
		if cart.save
			redirect_to cart_path(cart)
		else
			flash[:error] = "Sorry, that didn't work. Please try again"
			redirect_to request.referrer
		end
	end


	# private

	# def find_current_cart
	# 	if !current_user.current_cart.nil?
	# 		current_user.current_cart
	# 	else
	# 		cart = current_user.carts.build
	# 		current_user.current_cart = cart
	# 	end
	# end
end
