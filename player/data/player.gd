extends CharacterBody2D


const SPEED = 50
var direction = 'right'
var attacking = false

func _ready():
	# set player position
	position = GlobalVariables.player_position
	
	# camera limiter
	$Camera2D.limit_left = GlobalVariables.camera_limit_array[0]
	$Camera2D.limit_right = GlobalVariables.camera_limit_array[1]
	$Camera2D.limit_top = GlobalVariables.camera_limit_array[2]
	$Camera2D.limit_bottom = GlobalVariables.camera_limit_array[3]

# function to handle animation triggers
func get_animation():
	# walking animation triggers
	if Input.is_action_just_pressed('attack'):
		if direction == 'right':
			$AnimatedSprite2D.play('rAttack')
		elif direction == 'left':
			$AnimatedSprite2D.play('lAttack')
		elif direction == 'up':
			$AnimatedSprite2D.play("bAttack")
		elif direction == 'down':
			$AnimatedSprite2D.play('fAttack')

	if GlobalVariables.can_move:
		if Input.is_action_pressed('right'):
			direction = 'right'
			$AnimatedSprite2D.play('rightRun')
		elif Input.is_action_pressed('left'):
			direction = 'left'
			$AnimatedSprite2D.play('leftRun')
		elif Input.is_action_pressed('up'):
			direction = 'up'
			$AnimatedSprite2D.play('backRun')
		elif Input.is_action_pressed('down'):
			direction = 'down'
			$AnimatedSprite2D.play('frontRun')
		
		# idle animation triggers
		if Input.is_action_just_released('right'):
			$AnimatedSprite2D.animation = 'rIdle'
		elif Input.is_action_just_released('left'):
			$AnimatedSprite2D.animation = 'lIdle'
		elif Input.is_action_just_released('down'):
			$AnimatedSprite2D.animation = 'fIdle'
		elif Input.is_action_just_released('up'):
			$AnimatedSprite2D.animation = 'bIdle'
	
		
# handles animation and movement every frame
func _physics_process(_delta: float):
	var direction = Input.get_vector('left', 'right', 'up', 'down')
	velocity = direction * SPEED
	$CanvasLayer2/Label.text = str(GlobalVariables.player_score)
	if GlobalVariables.can_move:
		get_animation()
		move_and_slide()
	else:
		$AnimatedSprite2D.play()

# simple score
func inc_score(score):
	GlobalVariables.player_score += score
