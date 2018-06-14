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

  def self.count
    all.count
  end
end

class Order
  attr_accessor :order_id, :netprice, :total_price, :total_sales_tax

  @order_id =0
  @netprice
  @total_sales_tax
  @total_price

  # def initialize(a)
  #   @order_id = a
  # end

  # belongs_to :parent, :class_name => "Order", :foreign_key => "order_id"
  # has_many :children, :class_name => "Order", :foreign_key => "order_id"
  # has_many :friends

  def getAssociatedObjects(item_object)
    item_ordered = Array.new

    (0...item_object.length).each do |x| 
      if item_object[x].order_id == @order_id
        item_ordered = item_object[x]
      end
    end
    # puts "#{item_ordered[2]}"
    return item_ordered
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
item2 = Item.new(1,"music CD",14.99,false,1)
item3 = Item.new(1,"chocolate bar",0.85,false,1)
item4 = Item.new(1,"chocolate bar",0.85,false,2)


item_object = ObjectSpace.each_object(Item).to_a
puts "#{item_object[0].order_id.class}"


order1 = Order.new
order1.order_id=1

puts "Order 1 #{order1.order_id.class}"
puts "I O 0#{item_object[0].order_id.class}"
puts "I O ID#{item_object[0].object_id}"
puts "I O #{item_object .class}"

# puts "t = #{}"
# item_ordered = Array.new
# (0...item_object.length).each do |x| 
#   if item_object[x].order_id == order1.order_id
#     item_ordered = item_object[x]

#   end
#   puts item_ordered
# end
items_ordered = order1.getAssociatedObjects(item_object)
puts items_ordered