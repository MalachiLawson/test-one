extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	GlobalVariables.player_position = Vector2(212, 29)
	get_tree().change_scene_to_file("res://stages/cave_test/data/cave.tscn")
	
