class Order
  def self.random
    item_count = rand(1..7)
    item_types = Array.new(item_count) { FryShack.menu.to_a.sample }
    new(*item_types)
  end

  def initialize(*item_types)
    @items = item_types.map(&:new)
  end

  attr_reader :items

  def description
    @items.group_by(&:class).map { |type, items|
      pluralized = items.size == 1 ? "" : "s"
      "#{items.size} #{type.description}#{pluralized}"
    }.join(', ')
  end

  def ready?
    @items.all?(&:ready?)
  end

  def cost
    @items.map(&:cost).inject(0, &:+)
  end

  def wait_time
    @items.map(&:wait_time).max
  end
end
