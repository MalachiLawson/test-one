extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(_body):
	GlobalVariables.player_position = Vector2(60, 105)
	GlobalVariables.camera_limit_array = [0, 115, 0, 115]
	get_tree().call_deferred("change_scene_to_file", "res://stages/cave_test/data/cave_room.tscn")
