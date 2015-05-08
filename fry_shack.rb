# It's a game!
#
# Text-based.
#
# You have to cook up orders: burgers, fries, dogs, pizza...maybe weirder stuff.
# You have to "touch" each order a # of times to finish it.
# Each order is for a customer, and is made of a few items.
# When an order is completed, it goes to the customer, and you get paid.
#
# Your goal: make as much money as quickly as you can.
#
# You need to store the finished orders somewhere, so you can measure the time_to_finish.

require_relative 'lib/fry_shack'
require_relative 'lib/item'  # Item needs FryShack to be loaded, so Items can go on the menu.
require_relative 'lib/order'

require_relative 'lib/game'
