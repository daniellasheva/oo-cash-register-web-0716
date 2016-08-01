require 'pry'

class CashRegister

  attr_reader :discount, :title, :price
  attr_accessor :total, :quantity


  def initialize(discount=0)
    @total=0
    @discount=discount
    @items=[]
    @price=[]
    #binding.pry
  end

  def add_item(title, price, quantity=1)
    @quantity=quantity
    @title= title
    @total=total+(price*quantity)
    i=1
      for i in 1..quantity do #is there a better way to do this?
        @items<<title
        @price<<price
        i=i+1
      end
  end

  def apply_discount
    if discount==0
      "There is no discount to apply."
    else
    cut= total*(discount*0.01)
    @total=(total-(cut)).floor
    "After the discount, the total comes to $#{total}."
    end
  end

  def items  #self.items?
    @items
  end

  def void_last_transaction
    last=price.pop
    @total=total-last
  end

end
