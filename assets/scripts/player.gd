extends CharacterBody2D



func _physics_process(delta: float) -> void:
	
	# walking
	var angleRadians = deg_to_rad(rotation_degrees)
	if Input.is_action_pressed("forward"):
		velocity = Vector2(cos(angleRadians), sin(angleRadians)) * 100
	elif Input.is_action_pressed("backward"):
		velocity = Vector2(-cos(angleRadians), -sin(angleRadians)) * 30
	else:
		velocity = Vector2(0,0)

	# turning
	var direction := Input.get_axis("left", "right")
	if direction:
		rotation_degrees += direction * 5

	move_and_slide()
