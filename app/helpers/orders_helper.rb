module OrdersHelper
  def widgets
    Widget.all.map do |widget|
      ["#{widget.name} - $#{widget.price}", widget.id]
    end
  end
end
