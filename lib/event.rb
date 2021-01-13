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

    # The above solution iterates...
    #    over food_trucks to get the items (1),
    #    then iterating over food_trucks to get those that sell an item (2),
    #    then iterating over food_trucks to calculate the quantity (3).
    # That's a lot, and if the dataset gets large it would slow down
    # Refactor suggestion:
    # inventory = {}
    # @food_trucks.each do |truck|
    #   truck.inventory.each do |item, qty|
    #     inventory[item] ||= {quantity: 0, food_trucks: []}
    #     inventory[item][:quantity] += qty
    #     inventory[item][:food_trucks] << truck
    #   end
    # end
    # inventory
  end

  # I will admit I wrote these two methods without testing
  #   in my defense I wrote the total_inventory logic first and was in the zone
  #   My next step would be to make sure these have a test, or privatize them if I didn't
  #   want them in the public interface

  def info_for(item)
    # Create quantity & trucks hash for this item
    {
      quantity: quantity_for(item),
      food_trucks: food_trucks_that_sell(item.name)
    }
  end

  def quantity_for(item)
    @food_trucks.sum do |truck|
      truck.check_stock(item)
    end
  end
end
