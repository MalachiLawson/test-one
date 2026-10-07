extends AnimatedSprite2D

var player_inchat = false

func _ready():
	$Area2D.body_entered.connect(_on_body_entered)
	$Area2D.body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	if body.is_in_group('player'):
		player_inchat = true

func _on_body_exited(body):
	if body.is_in_group('player'):
		player_inchat = false
		
func _process(_delta):
	if player_inchat == true and Input.is_action_just_pressed("interact") and GlobalVariables.chat_done == false:
		GlobalVariables.can_move = false
		GlobalVariables.talking_jail = true
