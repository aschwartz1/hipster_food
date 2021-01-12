class Item
  attr_reader :name,
              :price

  def initialize(data)
    @name = data[:name]
    @price = parse_price(data[:price])
  end

  private

  def parse_price(price)
    # Cheaply format the price -- this really should be done better
    price[1..-1].to_f
  end
end
