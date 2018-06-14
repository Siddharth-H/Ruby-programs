$sales_tax = 10
$import_tax = 5

#Take input from a file
# x = Array.new
# line_num=0
# text=File.open('input.txt').read
# text.gsub!(/\r\n?/, "\n")
# text.each_line do |line|
#   x[line_num] = line.to_s
#   # print "#{line_num += 1} #{line}"
# end
# # puts "\nFirst Input"
# # print "#{x[0]}"


class Item
  attr_accessor :quantity, :name, :price, :isImported, :order_id 
  @quantity
  @name
  @price
  @isImported
  @order_id

  # belongs_to :Order


  def initialize(a,b,c,d,e)
    @quantity = a
    @name = b
    @price = c
    @isImported = d
    @order_id = e
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def seld.count
    all.count
  end

end

class Order < Items
    attr_accessor :order_id, :netprice, :total_price, :total_sales_tax

  @order_id
  @netprice
  @total_sales_tax
  @total_price

  def initialize(a)
    @order_id = a
  end

  # belongs_to :parent, :class_name => "Order", :foreign_key => "order_id"
  # has_many :children, :class_name => "Order", :foreign_key => "order_id"
  # has_many :friends

  def getAssociatedObjects
    Item_objects = ObjectSpace.each_object(Item).to_a
    puts Item_objects
    item_ordered = Array.new
    Item_objects.each do |x| 
      # if arr[x].order_id == @order_id
      #   item_ordered = arr[x]
      # end
      # item_ordered
      puts Item_objects[x]
    end
  end

  def calculateSalesTax
  end

  def calculateTotalPrice
  end

end

items = Hash.new
items = {
  "chocolate" =>"food",
  "music CD" => "entertainment",
  "book" => "education", 
  "headache pills" => "medical", 
  "perfume" => "cosmetics"
}

exempt_items = ["book","food","medical"]

item1 = Item.new(1,"book",12.49,false,1)
item1 = Item.new(1,"music CD",14.99,false,1)
item1 = Item.new(1,"chocolate bar",0.85,false,1)


Item_objects = ObjectSpace.each_object(Item).to_a
# Item_objects = item1.self.all

# local_variables.each {|x| puts x if (eval x.to_s).object_id == Item_objects[0].object_id}
# a =  Item_objects[0]
# puts a.quantity;
order1 = Order.new(1)
order1.getAssociatedObjects