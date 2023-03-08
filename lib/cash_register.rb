require 'pry'

class CashRegister

   attr_accessor :discount, :total, :items, :last_transaction

   def initialize(discount=20, total=0)
    @discount = discount
    @total = total
    @items = []
   end

   def add_item(title, price, quantity=1)
    @total = @total += (price*quantity)
    amount = quantity
        while amount > 0
            @items << title
            amount -= 1
        end
    @last_transaction = (price*quantity)
   end

   def apply_discount
    self.total = (self.total - (self.total * (self.discount*0.01))).round()
        if(self.total > 0)
            "After the discount, the total comes to $#{total}."
        else
            "There is no discount to apply."
        end
    end

    def items
    @items
    end

    def void_last_transaction
        @total = @total - @last_transaction
    end
end