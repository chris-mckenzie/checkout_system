class CheckoutCost

	# A CheckoutCost trigger will activate when the cost of a Checkout instance exceeds the threshold value	
	def initialize (cost_threshold)
		@cost_threshold = cost_threshold
	end

	def triggered? (checkout)
		checkout.cost > @cost_threshold
	end  
end
