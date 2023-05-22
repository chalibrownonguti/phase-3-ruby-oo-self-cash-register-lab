class CashRegister
    attr_accessor :total, :employee_discount
  
    def initialize(employee_discount = 0)
      @total = 0
      @employee_discount = employee_discount
      @items = []
    end
  
    def add_item(title, price, quantity = 1)
      quantity.times { @items << { title: title, price: price, quantity: quantity } }
      @total += price * quantity
    end
  
    def apply_discount
      if @employee_discount > 0
        discount_amount = @total * @employee_discount / 100.0
        @total -= discount_amount
        "After the discount, the total comes to $#{@total}."
      else
        "There is no discount to apply."
      end
    end
  
    def items
      @items.map { |item| item[:title] }
    end
  
    def void_last_transaction
      last_item = @items.pop
      @total -= last_item[:price] * last_item[:quantity]
      @total = 0.0 if @items.empty?
    end
  end
  

  expect(cash_register_with_discount.employee_discount).to eq(20)
  # Initialize with a 10% employee discount
  expect(cash_register_with_discount.apply_discount).to eq("After the discount, the total comes to $800.0.")

register.add_item("Item 1", 10) # Add an item with price $10
register.apply_discount         # Apply the discount
puts register.total             # Print the current total
puts register.items             # Print the items
register.void_last_transaction  # Void the last transaction
puts register.total             # Print the current total after voiding
