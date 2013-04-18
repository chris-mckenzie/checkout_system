class ProductPriceReduction

  # A ProductPriceReduction action applies a price change to a specific Product.
  # The modifier is a symbol, either :fixed or :percent
  def initialize (product, modifier, value)
    @product = product
    @modifier = modifier
    @value = value.to_f
  end

  def calculate_adjustment(checkout)
    case @modifier
      when :fixed
        checkout.items.count(@product) * [@value, @product.price].min
      when :percent
        checkout.items.count(@product) * @product.price * (([@value, 100].min) / 100)
    end
  end
end
