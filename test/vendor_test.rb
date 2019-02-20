require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'

class VendorTest < Minitest::Test
  def test_it_exists
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_instance_of Vendor, vendor
  end

  def test_it_has_a_name
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal "Rocky Mountain Fresh", vendor.name
  end

  def test_inventory_starts_as_empty_hash
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal ({}), vendor.inventory
  end

  def test_items_not_stocked_return_a_stock_of_zero
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal 0, vendor.check_stock('Peaches')
  end

  def test_items_can_be_stocked_w_quantity
    vendor = Vendor.new("Rocky Mountain Fresh")
    vendor.stock('Peaches', 30)
    vendor.stock("Tomatoes", 8)
    assert_equal 30, vendor.check_stock('Peaches')
  end

  def testr_vendor_can_sell_items
    vendor = Vendor.new("Rocky Mountain Fresh")
    vendor.stock('Peaches', 30)
    vendor.stock("Tomatoes", 8)
    vendor.sell('Peaches', 15)
    assert_equal 15, vendor.check_stock('Peaches')
  end

end
