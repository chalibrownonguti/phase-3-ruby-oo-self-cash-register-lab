class CashRegister
    def initialize(employee_discount = 0)
      @total = 0
      @employee_discount = employee_discount
      @items = []
    end
  
    def total
      @total
    end
  
    def add_item(title, price, quantity = 1)
      @total += price * quantity
      quantity.times { @items << title }
    end
  
    def apply_discount
      if @employee_discount > 0
        discount_amount = (@total * @employee_discount / 100.0).round(2)
        @total -= discount_amount
        "Success! Your discounted total is $#{@total}."
      else
        "Sorry, there is no discount to apply."
      end
    end
  
    def items
      @items
    end
  
    def void_last_transaction
      last_item = @items.pop
      item_price = item_price(last_item)
      @total -= item_price
      @total = 0.0 if @items.empty?
    end
  
    private
  
    def item_price(item)
      # Retrieve the price of the item from your data source
      # You can implement this based on your specific requirements
      # This is just a placeholder implementation
      10.0
    end
  end
  
