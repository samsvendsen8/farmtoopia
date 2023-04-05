# Extend the base Node class, as this script will manage the inventory without needing a specific node type
extends Node

# Define an empty dictionary to store items and their quantities
var items = {}

# Function to add a specified amount of an item to the inventory
func add_item(item_name, amount):
	# Check if the item is already in the inventory
	if items.has(item_name):
		# If the item exists, increment its quantity by the specified amount
		items[item_name] += amount
	else:
		# If the item does not exist, add it to the inventory with the specified amount
		items[item_name] = amount

# Function to remove a specified amount of an item from the inventory
func remove_item(item_name, amount):
	# Check if the item is in the inventory and has a quantity greater than or equal to the specified amount
	if items.has(item_name) and items[item_name] >= amount:
		# If the conditions are met, decrement the item's quantity by the specified amount
		items[item_name] -= amount
		# Check if the item's quantity has dropped to zero or below
		if items[item_name] <= 0:
			# If the quantity is zero or negative, remove the item from the inventory
			items.erase(item_name)
