extends CharacterBody2D


const SPEED = 50.0

func _ready():
	position = GlobalVariables.player_position
	$Camera2D.limit_left = GlobalVariables.camera_limit_array[0]
	$Camera2D.limit_right = GlobalVariables.camera_limit_array[1]
	$Camera2D.limit_top = GlobalVariables.camera_limit_array[2]
	$Camera2D.limit_bottom = GlobalVariables.camera_limit_array[3]

# function to handle animation triggers
func get_animation():

	# walking animation triggers
	if Input.is_action_pressed("right"):
		$AnimatedSprite2D.animation = "rightRun"
	elif Input.is_action_pressed("left"):
		$AnimatedSprite2D.animation = "leftRun"
	elif Input.is_action_pressed("up"):
		$AnimatedSprite2D.animation = "backRun"
	elif Input.is_action_pressed("down"):
		$AnimatedSprite2D.animation = "frontRun"
	
	# idle animation triggers
	if Input.is_action_just_released("right"):
		$AnimatedSprite2D.animation = "rIdle"
	if Input.is_action_just_released("left"):
		$AnimatedSprite2D.animation = "lIdle"
	if Input.is_action_just_released("up"):
		$AnimatedSprite2D.animation = "bIdle"
	if Input.is_action_just_released("down"):
		$AnimatedSprite2D.animation = "fIdle"
	
		
# handles animation and movement every frame
func _physics_process(_delta: float) -> void:
	get_animation()
	var direction := Input.get_vector("left", "right", "up", "down")
	velocity = direction * SPEED
	$CanvasLayer2/Label.text = str(GlobalVariables.player_score)
	move_and_slide()
	
# inventory management?
func inc_score(score):
	GlobalVariables.player_score += score
