extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.body_entered.connect(_on_body_entered)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_body_entered(body):
	if body.is_in_group("player"):
		GlobalVariables.player_score += 1
		queue_free()
	
