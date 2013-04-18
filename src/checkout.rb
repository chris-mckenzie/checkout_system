class Checkout
  attr_reader :items

  def initialize (promotions)
    @items_cost = 0
    @promotion_adjustment = 0
    @items = []
    @promotions = promotions
  end

  def scan(item)
    @items << item

    # Keep a running count of the full price
    @items_cost = @items_cost + item.price

    calculate_promotional_adjustments
  end

  def remove(item)
    @items.slice!(@items.index(item))

    # Keep a running count of the full price
    @items_cost = @items_cost - item.price

    calculate_promotional_adjustments
  end

  # Calculate the difference in price caused by any triggered promotions
  def calculate_promotional_adjustments
    @promotion_adjustment = 0

    # An assumption is made here that the promotions are ordered correctly. A global 10% discount must be applied last
    @promotions.each do |promotion|
      if promotion.triggered?(self)
        @promotion_adjustment += promotion.calculate_adjustment(self)
      end
    end
  end

  # The cost is returned as the base price of all items minus any promotional adjustments
  def cost
    (@items_cost - @promotion_adjustment).round(2)
  end
end
