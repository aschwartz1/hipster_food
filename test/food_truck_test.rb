require 'minitest/autorun'
require 'minitest/pride'
require './lib/food_truck'
require './lib/item'

class FoodTruckTest < Minitest::Test
  def setup
    @truck = FoodTruck.new("Generic Food Mobile")
    @apple_pie = Item.new({name: 'Apple Pie', price: '$2.50'})
    # @peach_pie = Item.new({name: 'Peach Pie', price: '$3.50'})
  end

  def test_it_exists
    assert_instance_of FoodTruck, @truck
  end

  def test_readable_attributes
    assert_equal "Generic Food Mobile", @truck.name
    assert_equal Hash.new, @truck.inventory
  end

  def test_can_check_stock
    assert_equal 0, @truck.check_stock(@apple_pie)
  end

  def test_can_stock_an_item
    @truck.stock(@apple_pie, 5)

    assert_equal 5, @truck.check_stock(@apple_pie)
  end

  def test_stocking_adds_not_overwrites
    @truck.stock(@apple_pie, 5)
    @truck.stock(@apple_pie, 3)

    assert_equal 8, @truck.check_stock(@apple_pie)
  end
end
