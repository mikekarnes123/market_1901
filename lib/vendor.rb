class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def stock(item, quantity)
    @inventory[item] = quantity
  end

  def check_stock(item)
    if @inventory.keys.include?(item)
      @inventory[item]
    else
      0
    end
  end

  def sell(item, quantity)
    og_inventory = @inventory[item]
    return false if !@inventory.keys.include?(item)
    if @inventory[item] <= quantity
      @inventory[item] = 0
      quantity - og_inventory
    elsif @inventory[item] == quantity
      @inventory[item] = 0
      0
    else
      @inventory[item] -= quantity
      0
    end
  end

end
