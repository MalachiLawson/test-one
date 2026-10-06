extends Node2D

@export var poo: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	var poo3 = poo.instantiate()
	poo3.position = Vector2(60,90)
	add_child(poo3)
	
	
