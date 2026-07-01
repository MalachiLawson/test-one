extends CharacterBody2D


const SPEED = 50.0

func get_animation():
	if Input.is_action_pressed("right"):
		$AnimatedSprite2D.animation = "rightRun"
	elif Input.is_action_pressed("left"):
		$AnimatedSprite2D.animation = "leftRun"
	elif Input.is_action_pressed("up"):
		$AnimatedSprite2D.animation = "backRun"
	elif Input.is_action_pressed("down"):
		$AnimatedSprite2D.animation = "frontRun"
	else:
		$AnimatedSprite2D.animation = "idle"

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	get_animation()
	var direction := Input.get_vector("left", "right", "up", "down")
	velocity = direction * SPEED



	move_and_slide()
