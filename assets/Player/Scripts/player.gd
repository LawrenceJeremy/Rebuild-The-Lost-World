extends CharacterBody2D

@export var walk_speed = 200
@export var run_speed = 400
@onready var sprite = $AnimatedSprite2D

func _physics_process(delta):
	# Horizontal and vertical input
	var input_vector = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	input_vector = input_vector.normalized()  # para consistent ang speed sa diagonal

	# Check if running (Shift or key assigned to "run")
	var is_running = Input.is_action_pressed("run")
	var current_speed = run_speed if is_running else walk_speed

	# Move character
	velocity = input_vector * current_speed
	move_and_slide()

	# Animation logic
	if sprite == null:
		return

	if input_vector == Vector2.ZERO:
		sprite.play("idle")  # idle kapag walang galaw
	else:
		if is_running:
			sprite.play("run")   # run kapag Shift pinindot
		else:
			sprite.play("walk")  # walk kapag may galaw pero hindi run

		# Flip sprite kung kaliwa
		if abs(input_vector.x) > 0:
			sprite.flip_h = input_vector.x < 0
