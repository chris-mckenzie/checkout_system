class Product
  attr_reader :product_code, :name, :price

  def initialize (prodouct_code, name, price)
    @product_code = product_code
    @name = name
    @price = price
  end
end
