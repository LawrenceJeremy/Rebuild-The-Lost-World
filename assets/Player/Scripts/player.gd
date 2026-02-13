extends CharacterBody2D

@export var speed = 150
@onready var sprite = $AnimatedSprite2D

func _physics_process(delta):
	var direction = Vector2.ZERO

	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("down"):
		direction.y += 1
	if Input.is_action_pressed("up"):
		direction.y -= 1

	velocity = direction.normalized() * speed
	move_and_slide()

	# Animation
	if direction == Vector2.ZERO:
		sprite.stop()
	else:
		if abs(direction.x) > abs(direction.y):
			if direction.x > 0:
				sprite.play("right")
			else:
				sprite.play("left")
		else:
			if direction.y > 0:
				sprite.play("down")
			else:
				sprite.play("up")
