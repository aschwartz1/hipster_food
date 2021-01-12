require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'

class ItemTest < Minitest::Test
  def setup
    @apple_pie = Item.new({name: 'Apple Pie', price: '$2.50'})
    @peach_pie = Item.new({name: 'Peach Pie', price: '$3.50'})
  end

  def test_it_exists
    assert_instance_of Item, @apple_pie
  end

  def test_readable_attributes
    assert_equal 'Apple Pie', @apple_pie.name
    assert_equal 2.50, @apple_pie.price
  end
end
