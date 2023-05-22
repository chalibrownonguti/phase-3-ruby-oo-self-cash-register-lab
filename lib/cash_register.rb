class CashRegister
    attr_accessor :total, :employee_discount
  
    def initialize(employee_discount = 0)
      @total = 0
      @employee_discount = employee_discount
      @items = []
    end
  
    def add_item(title, price, quantity = 1)
      quantity.times { @items << { title: title, price: price } }
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
      @total -= last_item[:price]
      @total = 0.0 if @items.empty?
    end
  end
  