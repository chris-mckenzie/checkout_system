Dir[File.join(".", "../**/*.rb")].each do |f|
  require f
end
require 'test/unit'

class TestCheckout < Test::Unit::TestCase


	def setup
    #Create the products for use in tests
		@product_1 = Product.new('001', 'Travel Card Holder', 9.25)
    @product_2 = Product.new('002', 'Personalised Cufflinks', 45.00)
    @product_3 = Product.new('003', 'Kids T-Shirt', 19.95)		

    @promotion_1 = Promotion.new(
     'Price Reduction when buying two or more Travel Card Holders', 
     ProductQuantity.new(@product_1, 2),
     ProductPriceReduction.new(@product_1, :fixed, 0.75)
     )

    @promotion_2 = Promotion.new(
     'Total cost discount 10%', 
     CheckoutCost.new(60),
     CheckoutCostReduction.new(:percent, 10)
     )
  end

  def test_example_1

  	checkout = Checkout.new([@promotion_1, @promotion_2])  	
  	
  	checkout.scan(@product_1)
  	checkout.scan(@product_2)
  	checkout.scan(@product_3)

  	assert_equal(66.78, checkout.cost)
  end

  def test_example_2

  	checkout = Checkout.new([@promotion_1, @promotion_2])  	
  	
  	checkout.scan(@product_1)
  	checkout.scan(@product_3)
  	checkout.scan(@product_1)	

  	assert_equal(36.95, checkout.cost)
  end

  def test_example_3

  	checkout = Checkout.new([@promotion_1, @promotion_2])  	
  	
  	checkout.scan(@product_1)
  	checkout.scan(@product_2)
  	checkout.scan(@product_1)
    checkout.scan(@product_3)	

   assert_equal(73.76, checkout.cost)
 end 
end