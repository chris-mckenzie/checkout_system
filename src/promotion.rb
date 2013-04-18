class Promotion

	attr_reader :name

	# Custom promotions can be created by providing different combinations of triggers and actions.
	def initialize (name, promotion_trigger, promotion_action)
		@name = name
		@promotion_trigger = promotion_trigger
		@promotion_action = promotion_action
	end

	# Check if the promotion trigger is fired by the checkout instance received
	def triggered? (checkout)
		@promotion_trigger.triggered?(checkout)
	end 

	# Returns a price adjustment based on the execution of the promotion action
	def calculate_adjustment(checkout)
		@promotion_action.calculate_adjustment(checkout)
	end
end