class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
	has_many :carts
	has_many :orders, through: :carts
	belongs_to :current_cart, class_name: "Cart"

	# def current_cart=(cart_id)
	# 	@current_cart = Cart.find_or_create_by(id: cart_id)
	# end

	# def current_cart
	# 	Cart.find(self.current_cart)
	# end
end
