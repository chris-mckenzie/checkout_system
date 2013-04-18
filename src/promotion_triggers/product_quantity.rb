class ProductQuantity

	# A ProductQuantity trigger will activate when a Product occurs at least the specified number of times in an instance of a Checkout		
	def initialize (product, quantity)
		@product = product
		@quantity = quantity
	end

	def triggered? (checkout)
		checkout.items.count(@product) >= @quantity
	end  
end
