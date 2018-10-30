# Creating non-shipped orders.
5.times do
  puts "Creating non-shipped orders."
  Order.create!
end

5.times do
  puts "Creating shipped orders."
  Order.create!(shipped_at: Time.now + Rand(60).minute)
end
