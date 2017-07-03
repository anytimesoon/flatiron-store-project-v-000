class StoreController < ApplicationController
  def index
  	@categories = Category.all
  	@items = Item.available_items
  	# @items = Item.all
  	# binding.pry
  end
end
