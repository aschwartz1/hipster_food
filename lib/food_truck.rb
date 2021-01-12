class FoodTruck
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    return 0 unless @inventory[item]
    @inventory[item]
  end

  def stock(item, quantity)
    if @inventory[item]
      @inventory[item] += quantity
    else
      @inventory[item] = quantity
    end
  end

  def sells?(item_name)
    @inventory.keys.any? do |item|
      item.name == item_name
    end
  end
end
