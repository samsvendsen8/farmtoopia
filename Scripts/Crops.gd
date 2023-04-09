extends Node2D

# Properties to store information about the crop
export var crop_type: String = "wheat"
export var growth_stage: int = 0
export var watered: bool = false

# Function to increase the growth stage of the crop
func grow():
	growth_stage += 1
	update_crop_sprite()

# Function to water the crop
func water():
	watered = true
	update_crop_sprite()

# Function to update the crop sprite based on the growth stage and whether it has been watered
func update_crop_sprite():
	# Determine which texture to display based on the growth stage and whether it has been watered
	if growth_stage == 0:
		if watered:
			$Sprite.texture = load("res://Sprites/crops-seeds--watered.png")
		else:
			$Sprite.texture = load("res://Sprites/crops-seeds.png")
	elif growth_stage == 1:
		if watered:
			$Sprite.texture = load("res://Sprites/crops-middle--watered.png")
		else:
			$Sprite.texture = load("res://Sprites/crops-middle.png")
	elif growth_stage == 2:
		if watered:
			$Sprite.texture = load("res://Sprites/crops-grown--watered.png")
		else:
			$Sprite.texture = load("res://Sprites/crops-grown.png")

# Function called when the node is added to the scene
func _ready():
	# Set the initial crop sprite
	update_crop_sprite()
