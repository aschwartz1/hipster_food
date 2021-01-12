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
end
