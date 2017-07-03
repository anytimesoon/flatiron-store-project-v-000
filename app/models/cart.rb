class Cart < ActiveRecord::Base
	belongs_to :user
	has_one :order
	has_many :line_items
	has_many :items, through: :line_items

	enum status: [:current, :submitted]

	def total
		total = 0.0

		self.line_items.each do |line_item|
			total += line_item.quantity * line_item.item.price
		end

		total
	end

	def add_item(new_item_id)
		
		new_item = Item.find(new_item_id)
		if self.items.include?(new_item)
			
			line_item = self.line_items.find_by(item_id: new_item_id)
			line_item.quantity += 1
			line_item.save

		else
			line_item = self.line_items.build(item_id: new_item_id, quantity: 1)
		end

		line_item
	end

	def place_order
		self.line_items.each do |line_item|
			line_item.item.inventory -= line_item.quantity
			line_item.item.save
		end
		self.status = :submitted
		self.build_order
		# binding.pry
		self.save
	end
end
