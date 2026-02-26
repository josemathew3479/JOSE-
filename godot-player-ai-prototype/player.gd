extends CharacterBody2D

const SPEED = 200.0
const ACCELERATION = 500.0
const FRICTION = 400.0

var current_velocity = Vector2.ZERO

func _physics_process(delta):
	# Get input
	var input_vector = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_d"):
		input_vector.x += 1
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_a"):
		input_vector.x -= 1
	if Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_s"):
		input_vector.y += 1
	if Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_w"):
		input_vector.y -= 1
	
	input_vector = input_vector.normalized()
	
	# Apply acceleration or friction
	if input_vector != Vector2.ZERO:
		current_velocity = current_velocity.move_toward(input_vector * SPEED, ACCELERATION * delta)
	else:
		current_velocity = current_velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = current_velocity
	move_and_slide()