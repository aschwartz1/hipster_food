require 'minitest/autorun'
require 'minitest/pride'
require './lib/food_truck'
require './lib/item'

class FoodTruckTest < Minitest::Test
  def setup
    @truck = FoodTruck.new('Generic Food Mobile')
    @apple_pie = Item.new({name: 'Apple Pie', price: '$2.50'})
    @peach_pie = Item.new({name: 'Peach Pie', price: '$3.50'})
  end

  def test_it_exists
    assert_instance_of FoodTruck, @truck
  end

  def test_readable_attributes
    assert_equal 'Generic Food Mobile', @truck.name
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

  def test_can_stock_multiple_items
    @truck.stock(@apple_pie, 5)
    @truck.stock(@peach_pie, 3)

    assert_equal 2, @truck.inventory.size
  end

  def test_can_tell_if_it_sells_something
    @truck.stock(@apple_pie, 5)
    @truck.stock(@peach_pie, 3)

    assert_equal true, @truck.sells?('Apple Pie')
    assert_equal false, @truck.sells?('Flaming Hot Cheetos')
  end

  def test_can_calculate_potential_revenue
    @truck.stock(@apple_pie, 5)
    @truck.stock(@peach_pie, 3)

    assert_equal 23.00, @truck.potential_revenue
  end

  def test_can_return_item_names
    @truck.stock(@peach_pie, 3)
    @truck.stock(@apple_pie, 5)

    assert_equal ['Apple Pie', 'Peach Pie'], @truck.item_names
  end
end
