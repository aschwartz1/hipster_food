require 'minitest/autorun'
require 'minitest/pride'
require './lib/event'
require './lib/food_truck'
require './lib/item'

class EventTest < Minitest::Test
  def setup
    @event = Event.new("Truckyard")
    setup_food_trucks
  end

  def setup_food_trucks
    @pie_truck = FoodTruck.new("Generic Food Mobile")
    apple_pie = Item.new({name: 'Apple Pie', price: '$2.50'})
    peach_pie = Item.new({name: 'Peach Pie', price: '$3.50'})
    @pie_truck.stock(apple_pie, 5)
    @pie_truck.stock(peach_pie, 3)

    @pizza_truck = FoodTruck.new("Za-mobile")
    pepperoni = Item.new({name: 'Pepperoni', price: '$1.00'})
    veggie = Item.new({name: 'Vegitarian', price: '$1.25'})
    @pizza_truck.stock(pepperoni, 10)
    @pizza_truck.stock(veggie, 20)
  end

  def test_it_exists
    assert_instance_of Event, @event
  end

  def test_readable_attributes
    assert_equal "Truckyard", @event.name
    assert_equal [], @event.food_trucks
  end

  def test_can_add_trucks
    @event.add_food_truck(@pie_truck)
    @event.add_food_truck(@pizza_truck)

    assert_equal [@pie_truck, @pizza_truck], @event.food_trucks
  end
end
