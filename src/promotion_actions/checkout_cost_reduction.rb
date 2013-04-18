class CheckoutCostReduction

  # A CheckoutCostReduction action applies a price change at a global Checkout level.
  # The modifier is a symbol, either :fixed or :percent
  def initialize (modifier, value)
    @modifier = modifier
    @value = value.to_f
  end

  def calculate_adjustment(checkout)
    case @modifier
      when :fixed
        [@value, checkout.cost].min
      when :percent
        checkout.cost * (([@value, 100].min) / 100)
    end
  end
end
