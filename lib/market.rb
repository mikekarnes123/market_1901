require 'pry'
class Market
  attr_reader :vendors
def initialize(name)
  @name = name
  @vendors = []
end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map {|vendor| vendor.name}
  end

  def vendors_that_sell(item)
    @vendors.select {|vendor| vendor.check_stock(item) > 0}
  end

  def sorted_item_list
    items = []
   @vendors.map do |vendor|
     vendor.inventory.keys.each {|key| items << key}
   end
    items.uniq.sort
  end

  def total_inventory
    total_inv = {}
    sorted_item_list.each {|item| total_inv[item] = 0}
    total_inv.each do |item, quantity|
      vendors_that_sell(item).each do |vendor|
        total_inv[item] += vendor.check_stock(item)
      end
    end
    total_inv
  end

  def sell(item, quantity)
    return false if !total_inventory.keys.include?(item)
    return false if total_inventory[item] < quantity
    vendors_that_sell(item).each do |vendor|
      unsold = vendor.sell(item, quantity)
      return true if unsold == 0
      quantity = unsold
    end

  end
end
