# Creating non-shipped orders.
puts "Creating non-shipped orders."
5.times do
  Order.create!
end

puts "Creating shipped orders."
5.times do
  Order.create!(shipped_at: Time.now + rand(60).minute)
end
