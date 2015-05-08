require 'set'
require 'forwardable'

class Q
  extend Forwardable
  def initialize
    @q = []
  end

  def_delegators :@q, :push, :pop, :empty?, :size

  def peek
    @q.last
  end
end

class FryShack
  def self.menu
    @menu ||= Set.new
  end

  def open_for_business!
    @orders = []

    @item_queues = {}
    self.class.menu.each do |item|
      @item_queues[item] = Q.new

      self.class.send(:define_method, "#{item.name.downcase}!") do
        queue = @item_queues[item]
        work_queue(queue)
      end
    end

    @cash_register = 0
  end

  def work_queue(queue)
    if queue.empty?
      puts "No #{item.name}s to work on!"
    else
      queue.peek.touch!
      if queue.peek.ready?
        puts "Done!"
        queue.pop
        check_orders
      else
        puts "#{queue.peek.time_to_complete} touches left"
      end
    end
  end

  def check_orders
    @orders.each do |order|
      if order.ready?
        @cash_register += order.cost
        puts "Ch-chng! #{order.cost}, total: #{@cash_register}"
        @orders.delete(order)
      end
    end
  end

  def take_order(order)
    @orders.push(order)

    puts "New Order: #{order.description}"
    order.items.each do |item|
      @item_queues[item.class].push(item)
    end
    nil
  end

  def queues?
    @item_queues.each do |item_type, items|
      puts "#{items.size} #{item_type}"
    end
    nil
  end
end
