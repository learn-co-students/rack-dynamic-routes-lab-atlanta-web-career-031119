class Item
  attr_accessor :name, :price
  #@@items = []
  #@@item = []
  def initialize(name,price)
    @name = name
    @price = price
    #@@items << self
    #@@item << self

  end



end
