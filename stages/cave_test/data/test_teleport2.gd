extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(_body):
	GlobalVariables.player_position = Vector2(-40, 3)
	GlobalVariables.camera_limit_array = [-64, 64, -32, 32]
	get_tree().call_deferred("change_scene_to_file", "res://stages/jail/data/jail_room.tscn")
