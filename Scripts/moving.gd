extends KinematicBody2D

const MOVE_SPEED = 100

onready var animated_sprite: AnimatedSprite = $AnimatedSprite

var velocity = Vector2.ZERO

func _physics_process(delta):
	velocity = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		animated_sprite.play("walk_right")
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		animated_sprite.play("walk_left")

	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		animated_sprite.play("walk_down")
	elif Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		animated_sprite.play("walk_up")

	if velocity != Vector2.ZERO:
		velocity = velocity.normalized() * MOVE_SPEED
	else:
		animated_sprite.play("idle")

	move_and_slide(velocity)
