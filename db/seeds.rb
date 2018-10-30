require 'factory_bot'
require 'faker'
FactoryBot.find_definitions unless FactoryBot.factories.count

widgets = (1..10).map do
  widget = FactoryBot.create :widget
  puts "Created widget: #{widget.name} with a price of $#{widget.price}"
  widget
end

puts "Unshipped orders:"
unshipped_orders = (1..5).map { FactoryBot.create :order, shipped_at: nil }
unshipped_orders.each do |order|
  (1..rand(5)).each do
    line_item = FactoryBot.create :line_item, widget: widgets[rand(10)], order: order
    puts "Added #{line_item.quantity} #{line_item.widget.name.pluralize} to order ##{order.id}"
  end
end

puts "Shipped orders:"
shipped_orders = (1..5).map { FactoryBot.create :order, shipped_at: Time.current - rand(60).minute }
shipped_orders.each do |order|
  (1..rand(5)).each do
    line_item = FactoryBot.create :line_item, widget: widgets[rand(10)], order: order
    puts "Added #{line_item.quantity} #{line_item.widget.name.pluralize} to order ##{order.id}"
  end
end
