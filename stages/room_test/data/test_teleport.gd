extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(_body):
	GlobalVariables.player_position = Vector2(221, 32)
	GlobalVariables.camera_limit_array = [0, 256, 0, 128]
	get_tree().call_deferred("change_scene_to_file", "res://stages/cave_test/data/cave.tscn")
