class Item
  def self.inherited(item_type)
    #puts "new menu item! #{item_type}"
    FryShack.menu.add(item_type)
  end

  def self.cost(dollars=@cost)
    @cost = dollars
  end
  def self.time_to_complete(touches=@time_to_complete)
    @time_to_complete = touches
  end

  def self.description
    self.name
  end
  def description
    self.class.description
  end

  def initialize
    @time_to_complete = self.class.time_to_complete
    @started_at = Time.new
  end

  def touch!
    # OOOH add some kind of 'overdone' logic: if you burn a burger, you have to make a new one!
    @time_to_complete = @time_to_complete - 1
    if ready?
      @finished_at = Time.new
    end
  end

  attr_reader :time_to_complete

  def ready?
    @time_to_complete <= 0
  end

  def cost
    self.class.cost
  end

  def wait_time
    (@finished_at || Time.new) - @started_at
  end
end

class Burger < Item
  time_to_complete 5
  cost 4.0
end
class Pizza < Item
  time_to_complete 8
  cost 5.0
end
class LargeFry < Item
  time_to_complete 3
  cost 2.5
end
class Soda < Item
  time_to_complete 2
  cost 1
end
class IceCream < Item
  time_to_complete 1
  cost 1
end
