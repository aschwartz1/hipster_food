class Event
  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    @food_trucks.map(&:name)
  end

  def food_trucks_that_sell(item_name)
    @food_trucks.select do |truck|
      truck.sells?(item_name)
    end
  end

  def quantity_for(item)
    @food_trucks.sum do |truck|
      truck.check_stock(item)
    end
  end

  def sorted_item_list
    @food_trucks.flat_map(&:item_names).uniq.sort
  end

  def all_items
    @food_trucks.flat_map(&:items).uniq
  end

  def total_inventory
    inventory = {}
    all_items.each do |item|
      inventory[item] = info_for(item)
    end

    inventory
  end

  private

  def info_for(item)
    # Create quantity & trucks hash for this item
    {
      quantity: quantity_for(item),
      food_trucks: food_trucks_that_sell(item.name)
    }
  end
end
